
class Workshops {
  String title;
  List<String> outcomes;
  List<String> coordinators;
  String desc;
  String url;
  String img;
  String whatsApp;
  Workshops({
    required this.title,
    required this.outcomes,
    required this.url,
    required this.desc,
    required this.coordinators,
    required this.img,
    required this.whatsApp,
  });
}

List<Workshops> workshops = [
  //1
  Workshops(
    title: "IOT AND EMBEDDED SYSTEMS",
    outcomes: [
      "Know how to  Design, Code, and Build IOT products.",
      "Learn to code using Arduino IDE.",
      "Knowledge about how to work with Microcontrollers, Sensors, and Relays.",
      "Learn how to connect to cloud IOT Platforms.",
    ],
    url: 'https://docs.google.com/forms/d/e/1FAIpQLScb1OaJDj9VjUMftWrsFARhWalgLreKz7A3shfkh2upMudfbQ/viewform?usp=sf_link',
    desc:
        "IoT and embedded systems control devices to connect and interact over the internet, transforming the way we live and work. They drive innovation across industries, enabling smarter homes, businesses, and cities. The future of IoT and embedded systems looks bright, with opportunities for continued growth and innovation.",
    coordinators: [
      "Ranjith Kumar A",
      "6374412610",
      "Joseph Peter J",
      "8870310990",
    ],
    img: 'assets/events/iot.png',
    whatsApp: 'https://chat.whatsapp.com/IBesiJTedziEi3XAf3EsHB',
  ),
  //2
  Workshops(
    title: "BASICS OF MACHINE LEARNING AND MEDICAL IMAGE PROCESSING",
    outcomes: [
      "Introduction to Machine Learning in Medical Image Processing.",
      "Introduction to Image processing.",
      "Use of Python for Image processing.",
      "A basic project on Medical Image Processing.",
    ],
    url: 'https://docs.google.com/forms/d/e/1FAIpQLSegqH5f93C9Dgp_QdyyUxzaS31GbAszNlGDzhVcD3wcCbiycw/viewform?usp=sf_link',
    desc:
        '''This workshop offers a one-shot introduction to medical image processing, starting from the basics. With a case study-based approach, attendees will have the opportunity to apply their learning in practical settings.
         Additionally, participants will gain hands-on experience with machine learning and have the chance to work on a mini-project.''',
    coordinators: [
      "Ajaymalolan K V",
      "8072335322",
      "Swarshaa S",
      "9148962377",
    ],
    img: 'assets/events/ml.png',
    whatsApp: 'https://chat.whatsapp.com/KMdkf5gsMM3C5FPKXYEO2U',
  ),
  //3
  Workshops(
    title: "MAKE YOUR PCB",
    outcomes: [
      " Knowledge about KICAD software.",
      "Experience to debug and analyze the circuit.",
      "Understanding the working and manufacturing process of PCB.",
      "Ability to design and create your own PCB.",
      "An overall idea about the components used in PCB and their processes.",
    ],
    url: 'https://docs.google.com/forms/d/e/1FAIpQLSeJlSUoOSq-rCGvJ-wbVy4K3aXme1FpatZEak6UHetHtGEamg/viewform?usp=sf_link',
    desc:
        "PCBs (Printed Circuit Boards) are fundamental to the construction of electronic devices, providing a foundation for connecting and integrating electronic components. The electronic components are integrated into the PCB to design a functional circuit. Proper design and fabrication of PCBs is essential to ensure functionality, reliability, and cost-effectiveness in electronic devices.",
    coordinators: [
      "Sanjeev V",
      "8940496469",
      "Sriram R B",
      "9486788449",
    ],
    img: 'assets/events/pcb.png',
    whatsApp: 'https://chat.whatsapp.com/C4iBbrsRTT6Fb7CwE1usP4',
  ),
  //4
  Workshops(
    title: "NETWORKING AND CYBER SECURITY",
    outcomes: [
      "Get to know about Network Devices And Protocols.",
      "Understand the process of Routing packets across the internet.",
      "Configure devices in Cisco packet tracer.",
      "Familiar about WLAN and WIFI attacks.",
      "Awareness about Basic Network Attacks.",
    ],
    url: 'https://docs.google.com/forms/d/e/1FAIpQLSd-gHjuCW_9P6wmGvk9PoDaUgkj0sjb11ayTSTyHb-sKdoWcA/viewform?usp=sf_link',
    desc:
        'Networking refers to the communication between devices or systems, enabling the sharing of information and resources. Cybersecurity involves protecting these networks from unauthorized access, data breaches, and cyber attacks. With the increasing use of technology in our daily lives, the importance of secure and reliable networks has become critical. Understanding both networking and cybersecurity is essential for protecting personal and business information.',
    coordinators: [
      "Saminathan S",
      "9360964582",
      "Hemaranjini M",
      "8098003617",
    ],
    img: 'assets/events/network-garage.png',
    whatsApp: 'https://chat.whatsapp.com/E0VGdT178iw91uzvinfFTe',
  ),
];
