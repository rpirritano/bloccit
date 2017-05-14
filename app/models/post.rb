class Post < ApplicationRecord
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy

    has_many :votes, dependent: :destroy

    after_create :create_vote

    default_scope { order('rank DESC') }

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
    
    #define up_votes by passing value of 1 to where.  This fethces a collection of votes
    #with a value of 1. Then call count on collection to get total of all up votes
    def up_votes
        votes.where(value: 1).count
    end

    #define down_votes by passing value of -1 to where.  This fethces only votes
    #with a value of -1. Then call count on collection to get total of all up votes
    def down_votes
        votes.where(value: -1).count
    end
    
    #user ActiveRecord's sum method to add the value of all given post's votes. Passing
    #:value to sum tells it what attribute to sum in the collection
    def points
        votes.sum(:value)
    end
    
    def update_rank
        age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
        new_rank = points + age_in_days
        update_attribute(:rank, new_rank)
    end

    private

    def create_vote
        user.votes.create(value: 1, post: self)
    end
    
end
