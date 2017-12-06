include RSpec

require_relative 'binary_search_tree'

RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("It Happened One Night", 89) }

  let (:tree) { BinarySearchTree.new(root) }
  let (:falcon) { Node.new("The Maltese Falcon", 100) }
  let (:casablanca) { Node.new("Casablanca", 98) }
  let (:psycho) { Node.new("Psycho", 96) }
  let (:north) { Node.new("North by Northwest", 99) }
  let (:window) { Node.new("Rear Window", 97) }
  let (:m) { Node.new("M", 95) }
  let (:third) { Node.new("The Third Man", 94) }
  let (:robin) { Node.new("The Adventures of Robin Hood", 93) }
  let (:philadelphia) { Node.new("The Philadelphia Story", 92) }
  let (:vertigo) { Node.new("Vertigo", 91) }
  let (:waterfront) { Node.new("On the Waterfront", 90) }


  describe "#insert(data)" do
    it "inserts new node as left child" do
      tree.insert(root, night)
      expect(root.left.title).to eq "It Happened One Night"
    end

    it "inserts a new node as left left child" do
      tree.insert(root, philadelphia)
      tree.insert(root, night)
      expect(root.left.left.title).to eq "The Philadelphia Story"
    end

    it "inserts a new node as left right child" do
      tree.insert(root, robin)
      tree.insert(root, third)
      expect(root.left.right.title).to eq "The Third Man"
    end

    it "inserts a new node as right child" do
      tree.insert(root, m)
      expect(root.right.title).to eq "M"
    end

    it "inserts a new node as right left child" do
      tree.insert(root, casablanca)
      tree.insert(root, window)
      expect(root.right.left.title).to eq "Rear Window"
    end

    it "inserts a new node as right right child" do
      tree.insert(root, north)
      tree.insert(root, falcon)
      expect(root.right.right.title).to eq "The Maltese Falcon"
    end
  end
end
