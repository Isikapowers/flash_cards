require "./lib/deck"
require "./lib/card"
require "./lib/turn"
require "./lib/round"

RSpec.describe Round do
  it "exists" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_an_instance_of(Round)
  end

  it "has a deck" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it "has turns" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it "has a take turn" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(new_turn).to be_an_instance_of(Turn)
    expect(new_turn.correct?).to eq(true)
  end

  it "has current card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it "has number correct" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Mars")
    new_turn = round.take_turn("Moon")

    expect(round.number_correct).to eq(2)
  end

  it "has number correct by category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it "has percent for correct guesses" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Moon")
    round.number_correct

    expect(round.percent_correct).to eq(50)
  end

  it "has percent for correct guesses by category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Mars")

    expect(round.percent_correct_by_category(:Geography)).to eq(100)
    expect(round.percent_correct_by_category(:STEM)).to eq(100)
  end

end
