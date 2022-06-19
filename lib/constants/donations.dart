class DonationList {
  final String petName,
      bloodGroup,
      location,
      ownerName,
      date,
      description,
      imagepath,
      breed,
      gender,
      userpfp,
      age;
  DonationList(
      {required this.petName,
      required this.bloodGroup,
      required this.location,
      required this.date,
      required this.description,
      required this.ownerName,
      required this.imagepath,
      required this.breed,
      required this.gender,
      required this.age,
      required this.userpfp});
}

List<DonationList> donations = [
  DonationList(
    petName: 'Barney',
    bloodGroup: 'DEA-1.1',
    location: 'Delhi',
    date: '22nd may 2022',
    description:
        'Hey, I have a 5 year old german shepherd dog with DEA-3 blood group needed. I live in extension area of lucknow. If any nearby hospital or individual can help, then please contact me.',
    ownerName: 'Jayden',
    imagepath: 'assets/images/donationdog.png',
    breed: 'Pit Bull',
    gender: 'Male',
    age: '3',
    userpfp:
        'https://images.unsplash.com/photo-1487600687979-1d262b7a28c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
  DonationList(
      userpfp:
          'https://img.freepik.com/free-photo/handsome-confident-smiling-man-with-hands-crossed-chest_176420-18743.jpg?w=2000',
      petName: 'Cameron',
      bloodGroup: 'DEA-4',
      location: 'Lucknow',
      date: '22nd may 2022',
      description:
          'Im in urgent need for DEA-7 blood group, if any one in lucknow can provide the blood please contact me as soon as possible',
      ownerName: 'Lyra',
      imagepath: 'assets/images/donation1.png',
      breed: 'Beagle',
      gender: 'Male',
      age: '10'),
  DonationList(
      userpfp:
          'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
      petName: 'Kaitlyn',
      bloodGroup: 'DEA-1.1',
      location: 'New York',
      date: '22nd may 2022',
      description:
          'If any hospital has DEA-1.1 blood stored please contact me urgently, im in a great need for you help',
      ownerName: 'Zelda',
      imagepath: 'assets/images/donation3.png',
      breed: 'Scotia',
      gender: 'Female',
      age: '9'),
  DonationList(
      userpfp:
          'https://i.guim.co.uk/img/media/33c508e9f0c30a90df363e3b5cc3925f0b70f5b6/0_0_3600_2159/master/3600.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=6c1e047f1edc4a54f1770458201ed69e',
      petName: 'Carlo',
      bloodGroup: 'DEA-3',
      location: 'New Jersey',
      date: '22nd may 2022',
      description:
          'Hey guys I have a german shepherd & im in urgent need for DEA-3 blood group if any hospital or individual can help, then please contact me',
      ownerName: 'Rhea',
      imagepath: 'assets/images/donation5.png',
      breed: 'Terrier',
      gender: 'Female',
      age: '6'),
  DonationList(
      userpfp:
          'https://burst.shopifycdn.com/photos/professional-man-portrait.jpg?width=500&format=pjpg&exif=1&iptc=1',
      petName: 'Trudie',
      bloodGroup: 'DEA-1.2',
      location: 'Texas',
      date: '22nd may 2022',
      description:
          'DEA-5 blood group needed urgently for my pet dog, to save my dog we need blood within 24 hours. please message if you can help.',
      ownerName: 'Elora',
      imagepath: 'assets/images/donation4.png',
      breed: 'Welsh',
      gender: 'Female',
      age: '2'),
  DonationList(
      userpfp:
          'https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=2000',
      petName: 'Kaycee',
      bloodGroup: 'DEA-3',
      location: 'Lucknow',
      date: '22nd may 2022',
      description:
          'If any hospital has DEA-5 blood stored please contact me, we can discuss about futher process by chat, thank you.',
      ownerName: 'Paul',
      imagepath: 'assets/images/cats6.png',
      breed: 'Shorthair',
      gender: 'Male',
      age: '1'),
  DonationList(
      userpfp:
          'https://img.freepik.com/free-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?w=2000',
      petName: 'Efren',
      bloodGroup: 'DEA-4',
      location: 'Paris',
      date: '22nd may 2022',
      description:
          'If anyone can provide me with DEA-5 blood group, please contact me, I am in urgent need, any help would mean a lot. thank you.',
      ownerName: 'Steve',
      imagepath: 'assets/images/cat7.png',
      breed: 'Ragdoll',
      gender: 'Male',
      age: '8'),
];
