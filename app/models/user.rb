class User < ActiveRecord::Base
  has_many :listings, :foreign_key => 'host_id'
  has_many :reservations, :through => :listings
  has_many :trips, :foreign_key => 'guest_id', :class_name => "Reservation"
  has_many :reviews, :foreign_key => 'guest_id'

  def host
    if self.listings.nil?
      self.host = false
    else
      self.host = true
    end
  end

  def guests
    # binding.pry
    guest_list = []
    self.listings.each do |l|
      guest_list << User.find_by_id(l.guest_ids)
    end

    guest_list
  end

  def host_reviews
    reviews = []
      self.guests.each do |g|
        g.reviews.each do |review|
          reviews << review
        end
      end
    reviews
  end

  def hosts
    # binding.pry
    host_list = []
    host_list << User.find_by_id(Reservation.find_by(guest_id: self.id).listing.host_id)

    host_list
  end

end
