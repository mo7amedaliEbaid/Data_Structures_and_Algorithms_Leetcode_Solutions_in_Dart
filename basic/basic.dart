import 'dart:collection';

void main() {
  final people = ['Pablo', 'Manda', 'Megan'];
  print(people[1]);
  people.add('Edith');
  print(people);
  people.insert(0, 'Ray');
  print(people);

  List<String> searchedForPeople =
      people.where((element) => element.toLowerCase().contains("b")).toList();
  print(searchedForPeople);

  final scores = {'Eric': 9, 'Mark': 12, 'Wayne': 1};
  scores['Andrew'] = 0;
  print(scores);
  final goodScores = scores.values.where((value) => value > 8);
  print(goodScores);
  final hashMap = HashMap.of(scores);
  print(hashMap);

  var bag = {'Candy', 'Juice', 'Gummy'};
  bag.add('Candy');
  print(bag);

  final peopleList = ['Pablo', 'Manda', 'Megan', 'Megan'];
  final peopleSet = peopleList.toSet();
  print(peopleSet);

  String name='Mohamed Ali';
  print(name.length.toString());

  List<String> nameParts=name.split(' ');
  String fName=nameParts.first;
  String lName=nameParts.last;
  print(fName);
  print(lName);
}
