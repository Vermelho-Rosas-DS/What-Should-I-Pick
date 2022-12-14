class Statistic < ApplicationRecord
  belongs_to :champion
  enum tier: { all: 0, iron: 1, bronze: 2, silver: 3, gold: 4, platinum: 5, diamond: 6, master: 7, grandmaster: 8, challenger: 9 },
       _prefix: true
  enum position: { top: 0, jungle: 1, mid: 2, adc: 3, support: 4 }, _prefix: true
  enum region: { global: 0, na: 1, euw: 2, eune: 3, oce: 4, kr: 5, jp: 6, br: 7, las: 8, lan: 9, ru: 10, tr: 11 }, _prefix: true
end
