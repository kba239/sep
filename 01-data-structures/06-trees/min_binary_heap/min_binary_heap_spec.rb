include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Maltese Falcon", 100) }

  let (:heap) { MinBinaryHeap.new(root) }
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
  let (:night) { Node.new("It Happened One Night", 89) }

  describe "#insert(data)" do
    it "inserts new node as root" do
      heap.insert(heap.root, casablanca)
      expect(heap.root.title).to eq "Casablanca"
    end

    it "inserts new node and switches it with root" do
      heap.insert(heap.root, casablanca)
      expect(heap.root.left.title).to eq "North by Northwest"
    end

    it "inserts a new node as left node" do
      heap.insert(heap.root, falcon)
      expect(heap.root.left.left.title).to eq "The Maltese Falcon"
    end

    it "sorts multiple nodes" do
      heap.insert(heap.root, m)
      heap.insert(heap.root, window)
      heap.insert(heap.root, third)
      expect(heap.left.left.title).to eq "Rear Window"
    end


  end

  describe "#printf" do
    it "prints" do
      heap.insert(heap.root, casablanca)
      heap.insert(heap.root, window)
      heap.insert(heap.root, falcon)
      heap.insert(heap.root, m)
      heap.insert(heap.root, third)
      heap.printf()
   end
  end
end
