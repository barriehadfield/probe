class HeartIcon < Hyperloop::Component
  render do
    SPAN(class: "i fa fa-heart-o")
  end
end

class ProbeIcon < Hyperloop::Component
  render do
    SPAN(class: "i fa fa-heart")
  end
end

class SettingsIcon < Hyperloop::Component
  render do
    SPAN(class: "i fa fa-cog")
  end
end

class SaveIcon < Hyperloop::Component
  render do
    SPAN(class: "i fa fa-check")
  end
end

class CloseIcon < Hyperloop::Component
  render do
    SPAN(class: "i fa fa-times")
  end
end

class NewProbeIcon < Hyperloop::Component
  render do
    SPAN(class: "i fa fa-plus")
  end
end
