#	Cards

Requires Ruby 2.0 or greater, tested with Ruby 2.2.2p95.
	
## Instantiate a Deck

- you specify the type of deck using a Rules object. FrenchRules is the usual, a 52 card deck with 4 suites, one card of each rank, Aces high. 


```
 $ deck = Deck.new FrenchRules.new
 $ deck.cards.count 
 => 52
 ```

- You can also instantiate a Pinochle deck


```
 deck = Deck.new PinochleRules.new
  deck.cards.count 
 => 48
 ```

## Draw and Shuffle

```
deck.draw => a Card object. Deck's cards are decremented so the same card cannot be drawn twice.

deck.shuffle => a Deck object with randomized cards

deck.cut => two Deck objects with 1/2 the cards. If the deck's card count is odd-numbered then one will have an extra card.

```

## Run the tests


```
$ ruby spec/deck_spec.rb

Started with run options --seed 39662

Deck::cards
  test_0001_has an array of cards                                 PASS (0.00s)
  test_0003_has the right number of cards                         PASS (0.00s)
  test_0002_has cards                                             PASS (0.00s)

Deck::drawing cards
  test_0005_after a draw, there are fewer cards                   PASS (0.00s)
  test_0002_then draws the second card                            PASS (0.00s)
  test_0004_draws two cards                                       PASS (0.00s)
  test_0003_returns a card name when it draws                     PASS (0.00s)
  test_0001_draws the first card                                  PASS (0.00s)

Deck::cutting the deck
  test_0001_handles dd numbers of cards                           PASS (0.00s)
  test_0003_cuts into two decks                                   PASS (0.00s)
  test_0002_results in equal decks                                PASS (0.00s)

Deck::shuffling
  test_0002_randomizes                                            PASS (0.00s)
  test_0001_returns a deck                                        PASS (0.00s)

Card::comparable cards
  test_0004_equal cards are equal                                 PASS (0.00s)
  test_0005_inequalities with equals                              PASS (0.00s)
  test_0002_a low card under-ranks a high card                    PASS (0.00s)
  test_0006_less_than_or_equal                                    PASS (0.00s)
  test_0003_suits do not affect the value                         PASS (0.00s)
  test_0001_a high card outranks a low card                       PASS (0.00s)
  test_0007_greater_than_or_equal                                 PASS (0.00s)

Finished in 0.00555s
20 tests, 22 assertions, 0 failures, 0 errors, 0 skips

```
## Play with the different objects

You can fire up the environment using:
```
bundle exec rake env
```

## Example output
```
bundle exec rake env
> deck = Deck.new FrenchRules.new
> deck.shuffle
> => #<Deck:0x007fbd89539c08
 @rules=
  #<ArbitraryRules:0x007fbd89539c30
   @cards=
    [6 of Spades,
     8 of Diamonds,
     Queen of Spades,
     8 of Hearts,
     8 of Clubs,
     3 of Hearts,
     Jack of Clubs,
     2 of Spades,
     10 of Clubs,
     3 of Spades,
     7 of Hearts,
     4 of Diamonds,
     7 of Diamonds,
     3 of Clubs,
     King of Diamonds,
     Queen of Diamonds,
     9 of Hearts,
     5 of Clubs,
     6 of Hearts,
     Jack of Diamonds,
     ...
  

[16] pry(main)> deck = deck.shuffle
=> #<Deck:0x007fbd891bc300
 @rules= 
 ...
    
[17] pry(main)> deck.draw.inspect
=> ["King of Diamonds"]
[18] pry(main)> deck.draw(3).inspect
=> ["Jack of Diamonds", "7 of Diamonds", "4 of Hearts"]
[19] pry(main)> deck.cards.count
=> 48
[20] pry(main)>


>[9] pry(main)> cut_deck = deck.cut
=> [#<Deck:0x007fbd89050480
  @rules=
   #<ArbitraryRules:0x007fbd89050520
    @cards=
     [6 of Clubs,
      7 of Clubs,
      ...
... #<Deck:0x007fbd890500e8
  @rules=
   #<ArbitraryRules:0x007fbd89050250
    @cards=
     4 of Hearts,
     ...

[10] pry(main)> deck.cut.map {|cut_deck| puts cut_deck.class}
[Deck, Deck]     




```

