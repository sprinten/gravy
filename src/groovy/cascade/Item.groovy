package cascade

import org.bson.types.ObjectId

/**
 *
 */
abstract class Item {

    ObjectId id
    String name

    @Override
    public String toString() {
        return name;
    }
}
