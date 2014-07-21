package grady.fields.embedded

import org.bson.types.ObjectId

/**
 * Marker abstract class for Fields Plugin Rendering. To be removed. Should rely on either constraints, annotations, etc
 */
abstract class Embed {

    ObjectId id

    @Override
    public String toString() {
        return id;
    }
}
