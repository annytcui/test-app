class CreateKvisas < ActiveRecord::Migration[5.1]
  def change
    create_table :kvisas do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :center
      t.string :consulate
      t.date :sent
      t.date :noa_1
      t.date :rfe
      t.date :rfe_reply
      t.date :noa_2
      t.date :nvc_received
      t.date :case_created
      t.date :nvc_left
      t.date :consulate_received
      t.date :p3_received
      t.date :p3_sent
      t.date :p4_received
      t.date :interview
      t.string :interview_result
      t.date :visa_received
      t.date :us_entry
      t.date :marriage

      t.timestamps
    end
  end
end
