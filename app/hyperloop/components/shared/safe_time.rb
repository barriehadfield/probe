class SafeTimeAgo < Hyperloop::Component

  param :date

  render(SPAN) do
    case
    when params.date.nil? || params.date == 0 || params.date.to_i == 978307200
      "Never"
    else
      TimeAgo(date: params.date.to_n)
    end
  end
end
