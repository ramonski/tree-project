
# NODE Model
window.Node = class Node
    constructor: (id) ->
        @id = id
        @__parent__ = null
        @__children__ = []

    is_root: ->
        @__parent__ is null

    get_root: ->
        current = @
        while not current.is_root()
            current = current.__parent__
        current

    get_parent: ->
        @__parent__

    has_child_nodes: ->
        @__children__.length isnt 0

    get_child_nodes: ->
        @__children__

    add_child_nodes: (nodes...) ->
        @__children__.push nodes...
        # set this node to the parent node
        node.__parent__ = @ for node in nodes

# vim: set ft=coffee ts=4 sw=4 expandtab:
