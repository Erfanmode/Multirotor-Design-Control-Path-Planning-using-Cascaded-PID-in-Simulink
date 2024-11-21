# Multirotor Design, Control & Path Planning with Obstacles Avoidance using Cascaded PID in Simulink
## 1- The Design of a quad-rotor with 6 degrees of freedom
This project is the term project for "Aerial Robotics" course of Mechanical Engineering Department at Sharif University of Technology.
The project includes two separate phases. In the first one, we designed a quad-rotor with 6 degrees of freedom standing a 30 minutes fly
for a 5 kilograms post package. 
We chose different component including propellers, motors, batteries, and navigational sensors. The multirotor contains two tilt rotors and two stationary rotors.
Therefore, our aircraft is capable of flying in arbitrary direction while preserving its orientation. 
We have also designed a robust cascaded PID controller for our robot so it can follow a trajectory.
By the way, huge shout-out to my dear friends, MohammadJavad Shamsedin & Asma Hallaji for their contributions to this project.

![{CE74FD13-F8A4-44CF-B04D-06C1B5FD180C}](https://github.com/user-attachments/assets/8603ca5f-b62f-474a-9d93-55a3f20551e5)


## 2- Multirotor Control, Path Planning, and Obstacle Avoidance
In the second phase, we implemented different algorithms such as Cascaded PID and Potential Field so the multirotor
follows a predetermined path. Additionally, it can avoid 3D obstacles till it reaches its destination.
To prevent stagnant points, we have coded a mechanism so in such cases, the aircraft moves perpendicular
to the potential vector and pass over the obstacles.
![{1BE7EB8C-9457-48CC-AA45-967476A77DEE}](https://github.com/user-attachments/assets/b1152eb5-4637-4290-834d-d0cf77367893)
![{09632B4E-B0C5-49C1-91E6-D0991FA99829}](https://github.com/user-attachments/assets/46a492a9-dec0-4b3a-bcf3-020bdee50249)
![{50E17C10-6778-45B8-8F50-039FDB020F61}](https://github.com/user-attachments/assets/1c1b62fa-c0b6-401b-adbf-f4125848662e)
![{90A5EE05-7FD3-416F-B5FA-B90FD39BFC36}](https://github.com/user-attachments/assets/80e31755-982d-4a8e-b8a7-15e7d6e7897c)
![{0C52DC54-C16C-4C46-BE79-3110A35B492A}](https://github.com/user-attachments/assets/4cd07835-3c07-45e5-b96b-b46f699c1510)
![{28C771C1-7978-494F-8812-9EE03B50347A}](https://github.com/user-attachments/assets/5895a567-c2c5-41f1-9123-16b7c932e572)


## This project contains:
- Multirotor Control & Path Following
- Path Generation & Obstacles Avoidance
- Disturbance & Noise Rejection
