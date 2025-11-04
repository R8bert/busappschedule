# Project: Real-Time Bus Scheduling Application

A mobile application developed with **Flutter** and **Firebase** to provide **real-time bus tracking and scheduling**. The system offers users live bus locations, estimated arrival times, and schedule updates through a unified interface.

![Application UI Showcase](https://user-images.githubusercontent.com/61593351/235311992-3c9ad466-bbbf-487b-a91a-6b8dd4644bf9.png)

---

## 1. Project Objective

The primary objective of this project was to develop a reliable solution for commuters and students to track public transit in real-time. The system is designed to display live bus positions and dynamic estimated arrival times (ETAs) by leveraging a Firebase Realtime Database. A secure administrative interface ensures that only authorized personnel can manage and update schedules and location data, maintaining system integrity and accuracy.

---

## 2. Key Features & Functionality

* **Real-Time Bus Tracking:**
    Dynamically displays the live GPS location of buses and updates their ETAs using listeners connected to the Firebase Realtime Database.

* **Secure Schedule Management:**
    Provides a secure administrative interface for authorized staff to add, remove, or modify bus routes and schedules in real-time.

* **User Authentication:**
    Employs Firebase Authentication to restrict data-modification privileges, ensuring that only authenticated administrators can alter system data.

* **Native Cross-Platform UI:**
    Developed using the Flutter framework to deliver a single, high-performance codebase with a smooth, responsive, and intuitive user interface for both Android and iOS.

* **System Reliability:**
    The application was tested to ensure low-latency data updates, high accuracy, and stable connectivity under various network conditions.

---

## 3. Technical Stack

| Area | Tools Used |
|---|---|
| **Frontend** | Flutter (Dart) |
| **Backend** | Firebase Realtime Database |
| **Authentication** | Firebase Auth |
| **Deployment** | Android and iOS builds |
| **Version Control** | GitHub |

---

## 4. Implementation Highlights

* Utilized Firebase Realtime Database listeners for seamless, live synchronization of location and schedule data to all connected clients.
* Implemented responsive UI layouts using Flutter's widget-based architecture to ensure compatibility with various screen sizes.
* Integrated the Firebase Authentication module to create a secure login/logout workflow for system administrators.
* Focused on a clean design and intuitive user flow to enhance usability.
* Ensured smooth UI transitions and minimal lag between data updates for a superior user experience.
