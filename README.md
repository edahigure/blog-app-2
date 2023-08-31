<a name="readme-top"></a>

<div align="center">



  <h3><b>Blog Ruby App</b></h3>

</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)

  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Available Scripts](#available-scripts)
  - [Clone](#clone)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

# 📖 Blog app Ruby 

> The Blog app will be a classic example of a blog website. You will create a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://en.wikipedia.org/wiki/Ruby_(programming_language)">Ruby</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>


- **Setup and controllers**
- **Controllers specs**
- **Creating a data model**
- **Processing data in models**
- **Views**
- **Forms**
- **Validations, Model specs, and n+1 problems**
- **Add Devise**
- **Add authorization rules**
- **Integration specs for Views**
- **Add API endpoints**
- **API documentation**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Prerequisites (an email account)

To run this appplication you need an email account properly configured. You need the 2-step verification for your gmail account for example as is done here:

https://help.warmupinbox.com/en/articles/4934806-configure-for-google-workplace-with-two-factor-authentication-2fa


and also and App password, you can generete it in the following link

https://myaccount.google.com/apppasswords?utm_source=google-account&utm_medium=myaccountsecurity&utm_campaign=tsv-settings&rapt=AEjHL4PWzrboEKqAJ1-uFiT_jc_JM7D04bZJ4RO6XgHr0kfA3EVo-zMEW8QSMS-wHxDfRHi83r9D_pwiNb9lH5DyMko0upx3EA


Then you can change the password and email in the files  ./config/environments/development.rb 
./config/environment.rb 
with your account information:

    user_name:      'edahigure@gmail.com',
    password:       'iewencoweo3892',
    domain:         'localhost:3000',
    address:       'smtp.gmail.com',
    port:          '587',
    authentication:  "plain",
    enable_starttls_auto: true

and also line 29 of file ./config/environments/initializers/devise.rb 
by
config.mailer_sender = 'edahigure@gmail.com'    


## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and use as a template, follow these steps.

### Clone <a name="clone"></a>

Clone this repository to your desired folder:

```sh
  git clone https://github.com/edahigure/blog-app.git
```

To install the necessary dependencies, you should run:

### `gem install bundler`

### `bundler install`

## 🤖 Available Scripts <a name="available-scripts"></a>

In the project directory, you can run:

### `rubocop -A`

To fix all Linter error automatically

## Run the tests

rspec ./spec/integration/file name_spec.rb

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- AUTHOR -->

## 👥 Author <a name="authors"></a>



👤 **Edahi Antonio Gutiérrez Reyes**

- GitHub: [@edahigure](https://github.com/edahigure)
- Twitter: [@edahigure](https://twitter.com/edahigure)
- LinkedIn: [edahigure](https://www.linkedin.com/in/edahigure/)

👤 **Therese Tuyisabe**

- GitHub: [@theresetuyi](https://github.com/theresetuyi)
- Twitter: [@THERESETUYISAB2](https://twitter.com/THERESETUYISAB2)
- LinkedIn: [therese-tuyisabe](https://www.linkedin.com/in/therese-tuyisabe/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **UI**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/edahigure/blog-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please let me know

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Thanks to microverse to asign me the homework
<br/>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

- **Is there any restriction to adapting the app to other purpose?**

  - No problem.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

