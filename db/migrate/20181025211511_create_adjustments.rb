class CreateAdjustments < ActiveRecord::Migration[5.1]
  def change
    create_table :adjustments do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :cis_office
      t.date :filed
      t.date :noa
      t.date :rfe
      t.date :bio_appt
      t.date :interview
      t.string :interview_result
      t.date :card_received

      t.timestamps
    end
  end
end
