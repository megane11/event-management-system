# 🎉 Event Management System (EMS)

## 📌 Overview

The **Event Management System (EMS)** is a full-stack Java web application built with **J2EE (Servlets + JSP)** to help users organize, manage, and participate in events in a streamlined and professional way. Designed as a school project, this platform supports **Admins**, **Organizers**, and **Attendees**, offering tailored functionality to each role.

## 🌍 Relevance & Impact

In countries like **Cameroon**, event planning often lacks digital organization. EMS bridges this gap by:

- **Improving accessibility** to event info for attendees.
- **Helping local organizers** manage tasks, vendors, and registration.
- **Promoting digitization** in local services.
- **Creating opportunities** for local tech talent and startups.

---

## 🎯 Project Objectives

- Digital event creation and listing
- User registration and authentication
- Event registration and ticketing
- Payment integration
- Admin management dashboard

---

## 👥 User Roles & Responsibilities

- **Admin**: Manages users, monitors events, handles issues.
- **Organizer**: Creates and manages their own events.
- **Attendee**: Registers for and participates in events.

---

## 🛠️ Technology Stack

| Layer         | Technology        |
|---------------|-------------------|
| Backend       | Java Servlets (J2EE) |
| Frontend      | JSP, HTML, Tailwind CSS |
| Database      | MySQL|
| Web Server    | Apache Tomcat 10+ |
| Build Tool    | Apache Ant |
| Version Control | Git + GitHub |
| Deployment    | Localhost|

---

## 🧱 Project Structure

```
EMS/
├── docs/
│   ├── EMS document.pdf
│   └── emsdb.sql
├── lib
├── nbproject
├── src/
│   ├── conf
│   └── java/
│       └── com/
│           └── ems/
│               ├── controller
│               ├── dao
│               ├── model
│               └── util
├── web/
│   ├── META-INF
│   ├── WEB-INF/
│   │   └── web.xml
│   ├── assets/
│   │   ├── css
│   │   ├── js
│   │   └── images/
│   │       ├── profileImages
│   │       └── events
│   ├── auth
│   ├── dashboard/
│   │   ├── admin.jsp
│   │   ├── organizer.jsp
│   │   └── attendee.jsp
│   └── index.jsp
├── .gitignore
├── README.md
└── build.xml
```
---

## 💻 Getting Started

### 🧩 Prerequisites

- Java JDK 17+
- NetBeans (v20 or higher)
- Apache Tomcat (v9+)
- MySQL server
- Git

### 🚀 Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/megane11/event-management-system.git

2. Import the SQL database found in /docs/emsdb.sql

3. Open the cloned project in netbeans IDE

4. Connect to the database
   - Open the Services tab
   - Open Databases > Drivers > MySQL (Connector/J driver)
   - Fill in the required credentials, test the connection and finish

5. Run the project
    