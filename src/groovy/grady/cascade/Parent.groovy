package grady.cascade

abstract class Parent<C extends Child> extends Item {
    Set<C> children
}