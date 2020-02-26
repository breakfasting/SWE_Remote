# A Card has two useful bits of information: its face value, and whether it is face-up or face-down. You'll want instance variables to keep track of this information. 
#You'll also want a method to display information about the card: nothing when face-down, or its value when face-up. I also wrote #hide, #reveal, #to_s, and #== methods.
# Common problem: Having issues with #hide and #reveal?

#@face_value
#@face_up?

#Card#hide
#Card#reveal
#Card#to_s <= what is this one? are we using to_s to switch sides?
#Card#==


class Card

  attr_reader :face

  def initialize(face)
    @face = face
    @face_up = false
  end

  def face_up?
    @face_up
  end

  def hide
    if @face_up
      @face_up = false
    end
  end

  def reveal
    if !@face_up
      @face_up = true
    end
  end

  #Card #to_s

  def ==(other_card)
    self.face == other_card.face
  end

end