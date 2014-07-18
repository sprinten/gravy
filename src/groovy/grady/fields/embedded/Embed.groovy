package grady.fields.embedded

import org.bson.types.ObjectId

/**
 *
 */
abstract class Embed {

    ObjectId id

    @Override
    public String toString() {
        return id;
    }
}
