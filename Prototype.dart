enum Gender{male, female}
enum Race {human, vampire, witch, elf, dwarf}

enum Eyes {blue, brown, green, grey}
enum HairType {straight, curly}
enum BodyType {athletic, thin, fat}
enum Magic {fire, water, earth, wind}

class Externality {
  final Eyes eyes;
  final HairType hairtype;
  final BodyType bodytype;
  
  const Externality(this.eyes, this.hairtype, this.bodytype);
  
  @override
  String toString(){
    var eyesStr = eyes.toString().split('.')[1];
    var hairStr = hairtype.toString().split('.')[1];
    var bodyStr = bodytype.toString().split('.')[1];
    
   return 'Eyes color: $eyesStr\nHair type: $hairStr\nBody type: $bodyStr\n';
  }
}

abstract class Prototype {
  Character clone();
}

class Character implements Prototype {
  String name;
  Gender gender;
  Race race;
  Externality externality;
  List<Magic> magic;
  
  Character({
    this.name = 'Noname',
    this.gender = Gender.male,
    this.race = Race.human,
    this.externality = const Externality(Eyes.blue, HairType.straight, BodyType.athletic),
  required this.magic});
  
  factory Character._fromCharacter(Character character){
    return Character(
      name: character.name,
      gender: character.gender,
      race: character.race,
      externality: character.externality,
      magic: character.magic
    );
  }
  
   @override
  String toString(){
    var infoStr = 'Character name: $name \n';
    infoStr+= 'Gender: ${gender.toString().split('.')[1]}\n';
    infoStr+= 'Race: ${race.toString().split('.')[1]}\n';
    infoStr+= externality.toString();
    infoStr+= 'Magic capabilities: {';
    magic.forEach((element)=> infoStr+= element.toString().split('.')[1]+',');
    infoStr+= '}';
    return infoStr;
  }
  
  @override
  Character clone(){
    return Character._fromCharacter(this);
  }
}

void main(List<String> arguments){
  print('---'*8 + 'Old' + '---'*8);
  var character1 = Character(name: 'Vita',
                            gender: Gender.female,
                            race: Race.human,
                            magic: <Magic>[Magic.earth, Magic.fire]);
  print(character1);
  print('---'*8 + 'New' + '---'*8);
  var newCharacter = character1.clone();
  newCharacter.magic.add(Magic.water);
  print(newCharacter);
 
}
