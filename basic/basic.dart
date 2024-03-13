import 'dart:collection';

void main(){

  final people = ['Pablo', 'Manda', 'Megan'];
  print(people[1]);
  people.add('Edith');
  print(people);
  people.insert(0, 'Ray');
  print(people);

  final scores = {'Eric': 9, 'Mark': 12, 'Wayne': 1};
  scores['Andrew'] = 0;
  print(scores);

  final hashMap = HashMap.of(scores);
  print(hashMap);

  var bag = {'Candy', 'Juice', 'Gummy'};
  bag.add('Candy');
  print(bag);
}