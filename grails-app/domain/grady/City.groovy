package grady

import cascade.Child

/**
 * City
 * A domain class describes the data object and it's mapping to the database
 */
class City extends Child<State> {

    static mapWith = "mongo"

//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 

    static belongsTo = [parent: State]

    static mapping = {
    }

    static constraints = {
        parent blank: false, nullable: false, children: true
    }
}
