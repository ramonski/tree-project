describe "Simple Tree", ->

    describe "root node", ->

        beforeEach ->
            @node = new Node 'node'

        it "extracts id", ->
            (expect @node.id).toEqual('node')

        it "is root", ->
            (expect @node.is_root()).toBeTruthy()

        it "gets root", ->
            (expect @node.get_root()).toEqual(@node)

        it "gets parent", ->
            (expect @node.get_parent()).toEqual(null)

        it "has children", ->
            (expect @node.has_child_nodes()).toBeFalsy()

        it "contains no children", ->
            (expect @node.get_child_nodes()).toEqual([])


    describe "child nodes", ->

        beforeEach ->
            @parent = new Node 'parent node'
            @child1 = new Node 'child node 1'
            @child2 = new Node 'child node 2'
            @sub_child1 = new Node 'sub child node 1'
            @sub_child2 = new Node 'sub child node 2'
            @child1.add_child_nodes [@sub_child1, @sub_child2]
            @parent.add_child_nodes [@child1, @child2]

        it "child node is not the root node", ->
            (expect @child1.is_root()).toBeFalsy()
            (expect @child2.is_root()).toBeFalsy()

        it "gets the correct root node", ->
            (expect @child1.get_root().id).toEqual('parent node')
            (expect @child2.get_root().id).toEqual('parent node')

        it "has children", ->
            (expect @parent.has_child_nodes()).toBeTruthy()

        it "gets children", ->
            (expect @parent.get_child_nodes()).toEqual([@child1, @child2])

        it "has children of children", ->
            (expect @child1.has_child_nodes()).toBeTruthy()
            (expect @child2.has_child_nodes()).toBeFalsy()

        it "gets root of sub child nodes", ->
            (expect @sub_child1.get_root().id).toEqual("parent node")
#
# vim: set ft=coffee ts=4 sw=4 expandtab:
