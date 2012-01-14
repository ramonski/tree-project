######################################################################
# tree-project - node.coffee
#

window.Node = class Node
    ### Class Node
    #
    # A simple node class to build up a hierarchical tree structure
    ###
    constructor: (id) ->
        @id = id
        @__parent__ = null
        @__children__ = []

    is_root: ->
        return @__parent__ is null

    get_root: ->
        current = @
        while not current.is_root()
            current = current.__parent__
        return current

    get_parent: ->
        return @__parent__

    has_child_nodes: ->
        return @__children__.length isnt 0

    get_child_nodes: ->
        return @__children__

    add_child_nodes: (nodes) ->
        nodes ?= []
        @__children__.push node for node in nodes
        # set this node to the parent node
        node.__parent__ = @ for node in nodes
        return nodes

# vim: set ft=coffee ts=4 sw=4 expandtab:
