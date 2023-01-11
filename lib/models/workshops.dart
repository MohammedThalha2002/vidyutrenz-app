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
    title: "Workshop on IoT and Cloud Computing",
    outcomes: [
      "Interface various analog and digital sensors to the ESP controller. ",
      "Create things in AWS Platform.",
      "Push the data to AWS IOT cloud.",
      "Retrieve data from AWS cloud.",
      "Build IOT Applications.",
    ],
    url: 'https://forms.gle/dkG1kDM8EnLVkw5N9',
    desc:
        "IoT workshop at Vidyutrenz is the upgrade your resume needs the most, get insights into the IoT domain while working with various practical interfaces to complete your journey putting the world in a networks.",
    coordinators: [
      "Karthicck A",
      "9789890411",
      "Pavan",
      "9962022697",
    ],
    img: 'assets/events/iot.png',
    whatsApp: 'https://chat.whatsapp.com/IBesiJTedziEi3XAf3EsHB',
  ),
  //2
  Workshops(
    title: "Workshop on VLSI Design",
    outcomes: [
      "Able to design Digital Circuits for particular applications.",
      "Able to write a Verilog HDL Code for Digital Circuits.",
      "Able to handle tools (EDA Playground).",
    ],
    url: 'https://forms.gle/GVCaeSjbyZv191VT7',
    desc:
        '''The aim of the workshop is to get a fundamental knowledge about Very large-scale integration (VLSI) .
             The entire VLSI training program is designed in such a manner that candidates well understand the concepts and get good overview of the design requirements and also they will go through hands-on experience.''',
    coordinators: [
      "Hari Narayanan B",
      "9677844879",
      "Hari V",
      "6379204221",
    ],
    img: 'assets/events/vlsi-design.png',
    whatsApp: 'https://chat.whatsapp.com/KMdkf5gsMM3C5FPKXYEO2U',
  ),
  //3
  Workshops(
    title: "Workshop on Image Processing",
    outcomes: [
      "Image processing fundamentals.",
      "Features identification.",
      "Implementation of supervised machine learning.",
      "Implementation of unsupervised machine learning",
      "Face recognition using SVM.",
      "Image classification using neural networks.",
    ],
    url: 'https://forms.gle/d8RCgXE5GFqxoxDWA',
    desc:
        "Image is the representation of viewable form of an object. Installing the unique ability of humans to analyse and recognize images is the intricate art of image processing. Learn this technology from scratch through 'Vidyutrendz Image processing workshop' getting a hands-on experience on machine learning.",
    coordinators: [
      "Tenail Karthikeya",
      "7095045039",
      "Karthikeyan ES",
      "9080879579",
    ],
    img: 'assets/events/image-processing.png',
    whatsApp: 'https://chat.whatsapp.com/C4iBbrsRTT6Fb7CwE1usP4',
  ),
  //4
  Workshops(
    title: "Workshop on Network Garage",
    outcomes: [
      "Familiarize with the working of basic network devices and protocols.",
      "Understand about the routing of packets in internet.",
      "Configure devices in Cisco packet tracer.",
      "Familiar about WLAN and WIFI attacks.",
      "Understand about basic network attacks.",
    ],
    url: 'https://forms.gle/V9xC5mcCgXM1BS1o6',
    desc:
        'The goal of this course is to provide a foundational view of communication networks.The principles upon which the Internet and other computer networks are built.How those principles translate into deployed protocols and to have hands-on experience solving challenging problems with network protocols.',
    coordinators: [
      "Gokul R",
      "9688093588",
      "Sam Joel P",
      "9176344166",
    ],
    img: 'assets/events/network-garage.png',
    whatsApp: 'https://chat.whatsapp.com/E0VGdT178iw91uzvinfFTe',
  ),
  //5
  Workshops(
    title: 'Workshop -startup 101-unlock by techiegen',
    outcomes: [
      "Understand the function of the entrepreneur",
      "Able to know how to approach the problem",
      "To have a clear knowledge about market trends",
      "To build Minimum viable product",
      "To have business approach",
    ],
    url: 'https://forms.gle/83KyNWVp6a7bGGZX7',
    desc:
        "The true entrepreneur is a doer and not a dreamer. Entrepreneurship is a skillset where creativity and innovation are the key for long term prosperity. Here we present you a wonderful opportunity to expertise and involve in the intensive discussion of Entrepreneurship conducted by Techigen who makes learning fun with memes and Instagram pages.",
    coordinators: [
      "N Sri Shamile",
      "8778239898",
      "P KRISHNA VAMSI",
      "9398203030",
    ],
    img: 'assets/events/startup-101.png',
    whatsApp: 'https://chat.whatsapp.com/GxDA11L5Z951RonIDVAsSf',
  )
];
