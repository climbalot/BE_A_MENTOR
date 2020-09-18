class Topic < ApplicationRecord
    has_many :mentor_topics
    TOPICS = [
        'General', 
        'Work culture',
        'Technical Questions',
        'Learning'
    ]
end
