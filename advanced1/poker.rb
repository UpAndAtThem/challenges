# Focus to get the tests below to pass. We're using 2 letters to represent a poker card - the first letter is the rank of the card, 
# represented by 2, 3, 4, 5, 6, 7, 8, 9, T, J, Q, K, and A. The second letter is the suit of the card, represented by 
# S, H, C and D (Spades, Hearts, Clubs and Diamonds). For example, "8D" means eight of diamonds, "TH" means ten of hearts, 
# and "AS" means ace of spades.

#best_hand

# loop over hands array
# assign hand value.
#   - loop over hand value makeup from highest rank to lowest
#   - if hand matches assign that to hand 
# select hand(s) that rank highest [multiple if ties]
#   - if hands tie check kicker or high card of hand
require 'pry'

class Poker
  attr_reader :hands
  CHECK_RANKS = [:royal_flush?, :straight_flush?, :four_of_a_kind?, :full_house?,
                 :flush?, :straight?, :three_of_a_kind?, :two_pair?, :one_pair?]

  ALL_STRAIGHTS = %w(A 2 3 4 5 6 7 8 9 10 J Q K A).each_cons(5).to_a

  def initialize(poker_hands)
    @hands = poker_hands
  end

  def suits(hand)
    hand.map { |card| card[1]}
  end

  def values(hand)
    hand.map { |card| card[0]}
  end

  def flush?(hand)
    current_suits = suits(hand)

    current_suits.all? { |suit| suit == current_suits[0] }
  end

  def royal_flush?(hand)
    current_values = values hand
    current_suits = suits hand

    current_values.sort == %w[A J K Q T] && flush?(hand)
  end

  def straight_flush?(hand)
    straight?(hand) && flush?(hand)
  end

  def group_of?(num_in_group, hand)
    values(hand).group_by(&:itself)
                .values
                .any? { |cards| cards.length == num_in_group }
  end

  def four_of_a_kind?(hand)
    group_of?(4, hand)
  end

  def full_house?(hand) 
    group_of?(3, hand) && group_of?(2, hand)
  end

  def straight?(hand)
    current_values = values(hand)

    ALL_STRAIGHTS.any? { |valid_straight| valid_straight.sort == current_values.sort}
  end

  def three_of_a_kind?(hand)
    group_of?(3, hand)
  end

  def two_pair?(hand)
    grouped = values(hand).group_by(&:itself)
                .values

    grouped.count { |group| group.size == 2} == 2
  end

  def one_pair?(hand)
    group_of?(2, hand)
  end

  def rank(hand)
    CHECK_RANKS.each do |rank_check|
      res = self.send(rank_check, hand)
      return rank_check if res
    end

    :high_card?
  end

  def assign_rank
    hands.map do |hand|
      rank(hand).to_s[0..-2]
    end
  end

  def best_hand
    hand_ranks = assign_rank
    binding.pry
  end
end
