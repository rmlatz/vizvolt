class WelcomeController < ApplicationController
require 'httparty'
  def index
    @us_states = [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]

    @years = [
      ["2001", "2001" ],
      ["2002", "2002"],
      ["2003", "2003"],
      ["2004", "2004"],
      ["2005", "2005"],
      ["2006", "2006"],
      ["2007", "2007"],
      ["2008", "2008"],
      ["2009", "2009"],
      ["2010", "2010"],
      ["2011", "2011"],
      ["2012", "2012"],
      ["2013", "2013"]
    ]

    # fuel_type = ["COW", "PEL", "PC", "NG", "OOG", "NUC", "HYC", "AOR", "WND", "SUN", "GEO", "WWW", "WAS", "HPS", "OTH"]
    # states = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]

    # states.each do |state|
    #   fuel_type.each do |type|
    #     value = HTTParty.get("http://api.eia.gov/series/?api_key=#{ENV["EIA_API_KEY"]}&series_id=ELEC.GEN.#{type}-#{state}-99.A")
    #     data = value['series'][0]["data"]
    #       data.each do |datum|
    #         State.create(state: state, fuel_code: type, year: datum[0], production: datum[1] )
    #       end
    #   end
    # end

  end

  def display
    @state = params[:state]
    @year = params[:year]
  end

end
