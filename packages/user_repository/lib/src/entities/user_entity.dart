import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
	final String userId;
	final String email;
	final String name;

	const MyUserEntity({
		required this.userId,
		required this.email,
		required this.name
	});
  //retourne un objet Map (une structure de données clé-valeur)
// Une méthode statique peut être appelée sur la classe elle-même sans avoir à créer une instance de la classe. 
// Les méthodes statiques ne dépendent pas de l'état actuel de l'objet, 
//car elles ne peuvent pas accéder directement aux propriétés ou aux méthodes d'une instance de la classe. 
//Elles opèrent uniquement sur les paramètres qu'elles reçoivent en entrée. 
//Cela peut être utile dans des cas où on doit créer un objet à partir de données externes, 
//comme des données de base de données, sans avoir besoin d'une instance préexistante de la classe.  
  
  //la méthode fromDocument est utilisée pour convertir un document 
 //(sous forme de Map) contenant des informations sur un utilisateur 
//en une instance de la classe MyUserEntity

	Map<String, Object?> toDocument() {
		return {
			'userId': userId,
			'email': email,
			'name': name,
		};
	}

	static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    //doc est l'objet Map qui contient les données du document. 
		return MyUserEntity(
			userId: doc['userId'], 
			email: doc['email'], 
			name: doc['name']
		);
	}

	@override
	List<Object?> get props => [userId, email, name];

}