class ListedPets {
  final String imagepath,
      petName,
      pettype,
      age,
      gender,
      description,
      userpfp,
      ownerName,
      bloodGroup,
      location;
  final String breed;
  ListedPets(
      {required this.bloodGroup,
      required this.breed,
      required this.petName,
      required this.age,
      required this.ownerName,
      required this.userpfp,
      required this.description,
      required this.gender,
      required this.imagepath,
      required this.pettype,
      required this.location});
}

List<ListedPets> listedpets = [
  ListedPets(
    userpfp:
        'https://media.istockphoto.com/photos/portrait-of-handsome-smiling-young-man-with-crossed-arms-picture-id1200677760?k=20&m=1200677760&s=612x612&w=0&h=JCqytPoHb6bQqU9bq6gsWT2EX1G5chlW5aNK81Kh4Lg=',
    petName: 'SOLA',
    bloodGroup: 'DEA-7',
    location: 'New Jersey',
    description:
        'Hi, I have a pet bulldog. Till now I had work from home. Taking care of the dog was easy but now since offices have opened up I have to move to Delhi till 1 July. If anyone can adopt the dog before july, then please message me.',
    ownerName: 'Dartista',
    imagepath: 'assets/images/pitbull.jpg',
    breed: 'PIT BULL',
    gender: 'MALE',
    age: '5',
    pettype: '',
  ),
  ListedPets(
      age: '3',
      bloodGroup: 'DEA-5',
      breed: 'Shepherd',
      description:
          'Hey guys, I have a german shepherd, 5 year old. If any one lives in lucknow and want to adopt a pet please contact me as soon as possible. Thank you.',
      gender: 'Female',
      imagepath: 'assets/images/adoption1.png',
      location: 'Lucknow',
      ownerName: 'Aakarsh',
      petName: 'Izabella',
      userpfp:
          'https://img.freepik.com/free-photo/handsome-confident-smiling-man-with-hands-crossed-chest_176420-18743.jpg?w=2000',
      pettype: ''),
  ListedPets(
      age: '4',
      bloodGroup: 'DEA-5',
      breed: 'Retriever',
      description:
          'Hi guys, If you want a golden retriever please contact me, I live in bara banki. I have to leave the town next week and so I need to donate my pet before that.',
      gender: 'Male',
      imagepath: 'assets/images/adoption2.png',
      location: 'Bara Banki',
      ownerName: 'Liam',
      petName: 'Darrion',
      userpfp:
          'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
      pettype: ''),
  ListedPets(
      age: '7',
      bloodGroup: 'DEA-3',
      breed: 'Husky',
      description:
          'My name in Raj vikram. I am looking for a person who can adopt my dog. Due to some un-avoidable reasons I have to leave the country and I need someone who can provide a home to my dog..',
      gender: 'Male',
      imagepath: 'assets/images/adoption3.png',
      location: 'New York',
      ownerName: 'Raj Vikram',
      petName: 'Adrian',
      userpfp:
          'https://burst.shopifycdn.com/photos/professional-man-portrait.jpg?width=500&format=pjpg&exif=1&iptc=1',
      pettype: ''),
  ListedPets(
      age: '8',
      bloodGroup: 'DEA-1.1',
      breed: 'Pug',
      description:
          'Hey, I have some personal emergency and I need to donate my pet dog as soon as possible if any one in town need the dog please contact me.',
      gender: 'Female',
      imagepath: 'assets/images/adoption4.png',
      location: 'Delhi',
      ownerName: 'William',
      petName: 'Stevie',
      userpfp:
          'https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=2000',
      pettype: ''),
  ListedPets(
      age: '9',
      bloodGroup: 'DEA-1.2',
      breed: 'Labrador',
      description:
          'hey people, I need some pet lover to take care after my golden retriever, I have a medical problem, not sure when I will be able to get out so I need some one for my dog’s adoption',
      gender: 'Female',
      imagepath: 'assets/images/adoption5.png',
      location: 'Sydney',
      ownerName: 'Paul',
      petName: 'Maggie',
      userpfp:
          'https://img.freepik.com/free-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?w=2000',
      pettype: ''),
  ListedPets(
      age: '9',
      bloodGroup: 'DEA-1.2',
      breed: 'Labrador',
      description:
          'hey people, I need some pet lover to take care after my golden retriever, I have a medical problem, not sure when I will be able to get out so I need some one for my dog’s adoption',
      gender: 'Female',
      imagepath: 'assets/images/adoption5.png',
      location: 'Sydney',
      ownerName: 'Paul',
      petName: 'Maggie',
      userpfp:
          'https://img.freepik.com/free-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?w=2000',
      pettype: ''),
];
