# TechNest 🌟

TechNest is a full-stack blogging web application where users can register, log in, create posts, comment on articles, and like content. Designed with the MVC architecture, the app ensures clean separation between business logic, UI, and data access layers. It emphasizes security, usability, and modular development using Java technologies.

## 📊 Features

- User registration and login
- Create, edit, and delete blog posts
- Like and comment on blog entries
- Profile management and image upload
- Responsive UI built with HTML, CSS, and JavaScript
- Admin-like access for managing blog data

## 🪄 Tech Stack

**Frontend:**

- HTML, CSS, JavaScript
- JSP (JavaServer Pages)

**Backend:**

- Java, Servlets, JDBC

**Database:**

- MySQL

## 🚀 Architecture

- **Model:** Java classes for User, Post, Comment, etc.
- **View:** JSP files like `index.jsp`, `profile.jsp`, `login_page.jsp`
- **Controller:** Servlets for handling requests (e.g., `LoginServlet`, `RegisterServlet`, `EditServlet`)

## 🔒 Security

- Uses `PreparedStatement` for all DB queries to prevent SQL injection.
- Session-based authentication and access control.

## 📁 Folder Structure

```
TechNest/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/tech/nest/
│       │       ├── dao/           # Data access objects (DAOs)
│       │       ├── entities/      # Model classes
│       │       ├── helper/        # Utility classes
│       │       └── servlets/      # Controllers
│       └── webapp/
│           ├── css/               # Stylesheets
│           ├── js/                # JavaScript files
│           ├── pics/              # Default image directory
│           └── *.jsp              # View templates
├── resources/
│   ├── img/                       # Default profile images (copy to deployed path)
│   └── blog_pics/                 # Sample blog images (copy to deployed path)
├── db/
│   ├── schema.sql                 # Table creation scripts
│   └── seed_data.sql              # Initial sample data for the application
```

## 📖 Image Folder Setup (Important!)

To properly load profile pictures and blog post images, follow these steps after running the project locally:

1. **Run the project once** using Tomcat inside Eclipse.
2. Navigate to your local Tomcat deployment path, typically:
   ```
   C:\Users\<your-username>\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TechNest
   ```
3. **Create the following folders** inside the above directory:
   - `/img`
   - `/blog_pics`
4. Copy the contents of the `/resources/img` and `/resources/blog_pics` folders from this repo into those respective folders.
5. Reload the web app to see all images correctly.

> Note: These folders are not committed to the repository to avoid tracking user uploads. You only need to do this once for initial setup.

## 🛠️ Database Setup

1. Start your MySQL server.
2. Create a new database (e.g., `technest_db`).
3. Execute the SQL scripts provided:
   - `schema.sql`: contains table definitions
   - `seed_data.sql`: inserts some sample initial data
4. Update `ConnectionProvider.java` with your DB name, username, and password.

## 📚 How to Run

1. Clone the repository:

```bash
git clone https://github.com/sambit81/TechNest.git
```

2. Import into **Eclipse** or any Java IDE.
3. Set up the **MySQL** database using the provided schema.
4. Configure your DB connection in `ConnectionProvider.java`.
5. Deploy using Apache Tomcat (v9 or above).
6. Access the app at `http://localhost:8080/TechNest`

## 📓 License

This project is open-source and free to use.

---

> Built with ❤️ by [Sambit Sinha](https://github.com/sambit81)

