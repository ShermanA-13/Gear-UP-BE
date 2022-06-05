class WeatherSerializer
  include JSONAPI::Serializer
  attributes :temp,
             :feels_like,
             :temp_min,
             :temp_max,
             :humidity,
             :weather,
             :weather_description,
             :weather_icon,
             :cloud_coverage,
             :wind_speed,
             :wind_direction,
             :wind_gust,
             :visibility,
             :percipitation_probability,
             :sunrise,
             :sunset
end