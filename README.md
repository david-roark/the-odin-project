# The Odin Project
## About The Odin Project
>The Odin Project is one of those "What I wish I had when I was learning" resources. Not everyone has access to a computer science education or the funds to attend an intensive coding school and neither of those is right for everyone anyway. This project is designed to fill in the gap for people who are trying to hack it on their own but still want a high quality education.
## Me and The Odin Project
>Here are all my projects and files I have learned and practiced in [Theodinproject](https://.theodinproject.com)

>I am learning Ruby on Rails and this is [my path](#path-learning)

# Folder structure

- Web_dev:

  - Some litle project for web development that I've learned in [Theodinproject / Web Development 101](https://www.theodinproject.com/courses/web-development-101)
  - Goalds: Basic about web, front-end (html/css/javascript), back-end and git

- Ruby:

  - Project and file ruby I've learned in [Theodinproject / Ruby Programming](https://www.theodinproject.com/courses/ruby-programming)
  - Goalds: Object-oriented design, testing, data structures

- Rails:

  - Link to my Ruby on Rails projects that I've learned in [Theodinproject / Ruby on Rails](https://www.theodinproject.com/courses/ruby-on-rails)
  - Please read in README.md in folder #rails to follow link to my projects

- Html - Css:

  - Link to my Html -Css course [Theodinproject / Html-css](https://www.theodinproject.com/courses/html-and-css)
  - Goals: Deep learning about HTML and CSS for UX web development

# Path learning
Jump to [Foundations](#foundations), [Ruby programming](#ruby-programming), [Database](#database), [Ruby on Rails](#ruby-on-rails), [HTML-CSS](#html-css), [JavaScript](#javascript)

## Foundations

1. Git basics
  - Git intro
  - GitHub
2. Font-end basics

  - [ ] HTML-CSS foundation
  - [ ] JavaScript foundation [_link_][15bf6f55]
    - [ ] "use strict"
    - Variables: naming, keywords (``var``, `let`, `const`)
    - Data types: Number, BigInt, String, Boolean, null, undefined, Objects and Symbols
    - Interaction: `alert`, `prompt`, `confirm`
    - Type conversions
    - Operator, maths
    - Conditional: `if...end`, `if..else if...end`, `? :`, `switch...case`
    - `||`, `&&`, `??`, `!(NOT)`
    - Loops: `while`, `do...while`, `for (;;)`
    - Keywords (`break`, `continue`); labels for break/continue
    - Functions: functions, callback functions, arrow functions
    - Objects (Array, Data, Error, ...)
      - Literals and properties, access a property, delete a property
      - `in` operator, `for...in` loop
      - Object references and copying
      - Object methods, keyword `this` in methods
      - Constructor, operator `new`, methods in constructor
      - Optional chaining (ex: `user?.address?.street`) (be careful!!!)
      -
      -
  - [ ] Developer tools

  [15bf6f55]: https://javascript.info "Modern JavaScript Learning"

3. Intro back-end

## Full-stack Ruby on Rails

### I. Ruby programming

1. Basic Ruby

  - [ ] Data types
  - [ ] Variables
  - [ ] Input, output
  - [ ] Conditional logic
  - [ ] Loops
  - [ ] Arrays
  - [ ] Hashes
  - [ ] Methods
  - [ ] Enumerable
  - [ ] Nested collections
  - [ ] Debugs

2. Object Oriented Programming (OOP)

  - [ ] Class
  - [ ] Instance
  - [ ] Methods
  - [ ] Inheritance
  - [ ] Modules
  - [ ] Setters, getters, `super` keyword, ...

3. Files and Serialization

  - [ ] File I/O
  - [ ] JSON, YAML

4. Advanced Ruby

  - [ ] Block, proc, lambda
  - [ ] `yield` keyword
  - [ ] Pattern matching - Ruby 3 (option)

5. Computer Science (a bit)
  - [ ] Recursive
  - [ ] Common Data Structures and Algorithms
    - [ ] Linked list
    - [ ] Binary Search Tree (BST)
    - [ ] Merge sort, Bubble sort

6. Testing
  - [ ] Test driven development (TDD)
  - [ ] RSpec

### II. Database

- [ ] Database
- [ ] Relative database, SQL

### III. Ruby on Rails

1. Rails basics

  - [ ] A Railsy Web Refresher
    - [ ] HTTP, REST, urls
    - [ ] MVC
    - [ ] APIs
    - [ ] Cookies, sessions, authentication, authorization

  - [ ] Routing
    - [ ] Root
    - [ ] RESTful routes
    - [ ] Route helper
    - [ ] Non-RESTful routes

  - [ ] Controllers
    - [ ] Naming
    - [ ] Renders, redirects
    - [ ] Params, strong params
    - [ ] Flash

  - [ ] Views
    - [ ] Layout
    - [ ] Preprocessors (erb, scss, coffee, ...)
    - [ ] Helper methods (`link_to`, `image_tag`, ...)
    - [ ] Render

  - [ ] The Asset Pipeline
  - [ ] Webpacker
  - [ ] Deployment (with Heroku)

2. Active record basics

  - [ ] ORM (Object-Relational-Mapping)
  - [ ] Rails models
  - [ ] Migration, rollback
  - [ ] Validations
  - [ ] Associations

3. Forms and authentication

  - [ ] CSRF token
  - [ ] Helper: `form_for`, `form_with`, `form_tag`, `*_tag`, ...
  - [ ] Sessions cookies
  - [ ] _Devise gem_

4. Advanced form and active record

  - [ ] Active record query
    - [ ] ActiveRecord::Relation: `#where`, `#all`, ...
    - [ ] ActiveRecord::FinderMethods: `#find`, `#find_by`, `#last`, `#first`, `#take`, ...
    - [ ] ActiveRecord::QueryMethods: `#select`, `#from`, `#group`, `#having`, `#order`, `#includes`, ...
    - [ ] Highlight: chaining queries(`#order`, ...), checking (`#any?`, `#exist?`, `#many?`,...), mathematical (`#count`, `#max`)
    - [ ] Problem **N + 1 query** => `#includes`, `#pluck`, _bullet gem_
    - [ ] Scopes
    - [ ] Ninja: `#find_by_sql`

  - [ ] Active record associations
    - [ ] `has_one`, `has_many`, `belongs_to`
    - [ ] `foreign_key`, `class_name`, `through`, `source`
    - [ ] polymorphic
    - [ ] dependent
    - [ ] Self joins

  - [ ] Active record callback
    - [ ] `before_create`, `after_create`, `around_create`, `before_destroy`, `before_rollback`, ...
  - [ ] Advanced form
    - [ ] Helper: `select_tag`, `options_for_select`, ...
    - [ ] Nested forms, delete nested form objects
    - [ ] _simple_form gem_

5. APIs
  - [ ] Basics create API app with Rails
  - [ ] Rendering to XML, JSON

6. Mailer and advanced topics

  - [ ] Mailer
  - [ ] Routing: `resource`, `resources`, nested routes, `member`, `collection`, `redirect`
  - [ ] Nested layout: `content_for`, `yield`
  - [ ] Design pattern: SOLID
  - [ ] I18n: Internationalization
  - [ ] WebSockets

### IV. HTML - CSS

1. HTML page structure

  - [ ] Elements tags, elements attributes
  - [ ] Ids, classes
  - [ ] Links, media, ...

2. Display and input data

  - [ ] Tables
  - [ ] Lists
  - [ ] Forms

3. CSS

  - [ ] Units: px, %, rem, em, vh, vw, ...
  - [ ] Fonts, colors
  - [ ] Box model: block, inline, inline-block
  - [ ] Margin, padding, width, height
  - [ ] Float, position
  - [ ] Flex
  - [ ] Grid
  - [ ] Background, gradients

4. Design and UX

  - [ ] Font: font-family (serif, san-serif, ...)
  - [ ] ...

5. Responsive and Frameworks

  - [ ] Media query
  - [ ] Introduction some CSS frameworks: Bootstrap, Zurb Foundation, TailwindCSS

6. Advanced CSS

  - [ ] Animation
  - [ ] Border radius, box shadow
  - [ ] Transforms
  - [ ] Pseudo-Elements
  - [ ] Preprocessors: SCSS, SASS, LESS

### V. JavaScript
<!-- TODO Need to add more details of each part -->
1. Organizing Js code
  - [ ] Objects and Object constructors
  - [ ] Factory functions, module patterns
  - [ ] Classes
  - [ ] ES6 modules
  - [ ] Webpack
  - [ ] OOP principles
2. Tools and a few practical applications of JavaScript
   - [ ] Linting tools
   - [ ] Dynamic user interface interactions, forms
   - [ ] ES
3. Asynchronous JavaScript and APIs
  - [ ] JSON
  - [ ] Async
  - [ ] Working with APIs
  - [ ] Async and await
4. React Js (front-end framework)
  - [ ] State and props
  - [ ] Handle inputs anh render lists
  - [ ] Lifecycle methods
  - [ ] Hooks
  - [ ] Router
  - [ ] Advanced concepts
5. Testing
6. JavaScript and Backend
