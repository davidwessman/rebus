class Question < ApplicationRecord
  belongs_to(:post)
  attr_accessor(:guess)

  def correct?
    if guess && answer.downcase == guess.downcase
      true
    else
      errors.add(:guess, I18n.t('model.question.incorrect_guess'))
      false
    end
  end

  def guess_error
    errors.messages.fetch(:guess, [])
  end

  def to_s
    title
  end
end
