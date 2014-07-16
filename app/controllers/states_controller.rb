class StatesController < ApplicationController
  respond_to :json

  def index

    total_cow = State.where(fuel_code: "COW", year: "2013").sum(:production).to_f
    total_pel = State.where(fuel_code: "PEL", year: "2013").sum(:production).to_f
    total_pc = State.where(fuel_code: "PC", year: "2013").sum(:production).to_f
    total_ng = State.where(fuel_code: "NG", year: "2013").sum(:production).to_f
    total_oog = State.where(fuel_code: "OOG", year: "2013").sum(:production).to_f
    total_nuc = State.where(fuel_code: "NUC", year: "2013").sum(:production).to_f
    total_hyc = State.where(fuel_code: "HYC", year: "2013").sum(:production).to_f
    total_aor = State.where(fuel_code: "AOR", year: "2013").sum(:production).to_f
    total_wnd = State.where(fuel_code: "WND", year: "2013").sum(:production).to_f
    total_sun = State.where(fuel_code: "SUN", year: "2013").sum(:production).to_f
    total_geo = State.where(fuel_code: "GEO", year: "2013").sum(:production).to_f
    total_www = State.where(fuel_code: "WWW", year: "2013").sum(:production).to_f
    total_was = State.where(fuel_code: "WAS", year: "2013").sum(:production).to_f
    total_hps = State.where(fuel_code: "HPS", year: "2013").sum(:production).to_f
    total_oth = State.where(fuel_code: "OTH", year: "2013").sum(:production).to_f

    results = [
      {name: "Coal", production: total_cow},
      {name: "Petroleum Liquid", production: total_pel},
      {name: "Petroleum Cake", production: total_pc},
      {name: "Natural Gas", production: total_ng},
      {name: "Other Gases", production: total_oog},
      {name: "Nuclear", production: total_nuc},
      {name: "Hydro-electric", production: total_hyc},
      {name: "Other Renewables", production: total_aor},
      {name: "Wind", production: total_wnd},
      {name: "Solar", production: total_sun},
      {name: "Geothermal", production: total_geo},
      {name: "Wood/Wood Derivatives", production: total_www},
      {name: "Other Biomass", production: total_was},
      {name: "Hydro-electric Pumped Storage", production: total_hps},
      {name: "Other", production: total_oth},
    ]

    render json: results
  end

  def show
    state = params[:state]
    year = params[:year]
    results = []
    result = State.where(state: state, year: year)

    result.each do |entry|
      results.push({name: entry.fuel_code, production: entry.production.to_f})
    end
    render json: results
  end

  def display

  end

end
