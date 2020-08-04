require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_number(phone_number)
  n = phone_number.to_s.gsub(/\D/, '')
  if n.size < 10 || n.size > 11 || (n.size == 11 && !(n.start_with? '1'))
    'This is a bad number phone'
  else
    n.ljust(10, '1')[1..9]
  end
end

def legislators_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    )
    legislators.officials
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thanks_letter(id, _phone_number, personal_latter)
  Dir.mkdir('../output') unless Dir.exist?('../output')
  file_name = "../output/thanks_#{id}.html"

  File.open(file_name, 'w') do |file|
    file.puts personal_latter
  end
end

def time_analysis(arr_time)
  h = {}
  arr_time.uniq.each { |hour| h['time: ' + hour] = arr_time.count hour }
  h.to_a.sort { |a, b| b[-1] <=> a[-1] }
end

def week_day_analysis(arr_week_day)
  a = %i[sun mon tue wed thur fri sat]
  h = { sun: 0, mon: 0, tue: 0, wed: 0, thur: 0, fri: 0, sat: 0 }
  arr_week_day.uniq.each do |day|
    h[a[day]] = arr_week_day.count(day)
  end
  h
end

contents = CSV.open '../data/event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read('../form_letter.html')
erb_template = ERB.new template_letter
arr_time = []
arr_week_day = []

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = clean_phone_number(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  time = DateTime.strptime(row[:regdate].to_s.gsub('/0', '/200'), '%m/%d/%Y %H:%M')

  # array of time:
  arr_time.push row[:regdate].to_s.split(' ')[-1].split(':')[0]
  # array of week day: 0 => Sunday, 1 => Monday,...
  arr_week_day.push(Date.new(time.year, time.month, time.day).wday)
  personal_latter = erb_template.result(binding)
  save_thanks_letter(id, phone_number, personal_latter)
end

# p time_analysis(arr_time)
# p week_day_analysis(arr_week_day)
