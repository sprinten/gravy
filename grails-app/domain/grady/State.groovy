package grady

import cascade.Parent

/**
 * State
 * A domain class describes the data object and it's mapping to the database
 */
class State extends Parent<City> {

    static mapWith = "mongo"

//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static	hasMany		= [children: City]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
    }

    public static child = "city"
}
