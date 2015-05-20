#  Created by Tucker Sherman on 3/13/2015.
#  Copyright (c) 2015 Apache licence 2.0

class Simulator
  def initialize (device)
    @device = device
    case device
    when "iPhone 4"
      #TODO: set these screen sizes
      @screenSize = [960,640]
    when "iPhone 4s"
      @screenSize = [960,640]
    when "iPhone 5"
      @screenSize = [1136,640]
    when "iPhone 5c"
      @screenSize = [1136,640]
    when "iPhone 5s"
      @screenSize = [1136,640]
    when "iPhone 6"
      @screenSize = [1334,750]
    when "iPhone 6+"
      @screenSize = [2208,1242]
    end
  end

  def foreground
     `osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e 'set frontmost to true' -e 'end tell'`
     puts "simulator moved to the foreground"
  end

  def start_highway_drive
    foreground
    exit = `osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e'click menu bar item "Debug" of menu bar 1' -e'delay 0.1' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 124' -e'key code 125'-e'key code 125'-e'key code 125'-e'key code 125'-e'key code 125' -e'keystroke "" & return' -e'delay 2' -e'end tell'`
    puts("simulator highway drive started")
  end

  def stop_highway_drive
    foreground
     `osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e'click menu bar item "Debug" of menu bar 1' -e'delay 0.1' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 124' -e'keystroke "" & return' -e'delay 2' -e'end tell'`
    puts("simulator highway drive stopped")
  end

  def hit_home
    foreground
    exit =`osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e'keystroke "H" using command down' -e'delay 2' -e'end tell'`
    puts("tapped simulator home button")
  end

  def doubletap_home
    foreground
    `osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e'keystroke "HH" using command down' -e'delay 2' -e'end tell'`
    puts("double tapped simulator home button")
  end


  # TODO: make these dynamic (currently specific to iphone 6)
  def springboard_page_switch_to(page)
    case device
    when "iPhone 4"
      #TODO: get these coordinates
      case page
        when 1
          appium_tap(181,564)
        when 2
          appium_tap(197,564)
      end
    when "iPhone 4s"
      case page
        when 1
          $driver.execute_script 'mobile: tap', :x =>181, :y => 564
        when 2
          $driver.execute_script 'mobile: tap', :x =>197, :y => 564
      end
    when "iPhone 5"
      case page
        when 1
          $driver.execute_script 'mobile: tap', :x =>181, :y => 564
        when 2
          $driver.execute_script 'mobile: tap', :x =>197, :y => 564
      end
    when "iPhone 5s"
      case page
        when 1
          $driver.execute_script 'mobile: tap', :x =>181, :y => 564
        when 2
          $driver.execute_script 'mobile: tap', :x =>197, :y => 564
      end
    when "iPhone 6"
      case page
        when 1
          appium_tap(181,564)
        when 2
          appium_tap(197,564)
      end
    when "iPhone 6+"
      case page
        when 1
          $driver.execute_script 'mobile: tap', :x =>181, :y => 564
        when 2
          $driver.execute_script 'mobile: tap', :x =>197, :y => 564
      end    end

  end

  def appium_tap (x,y)
    $driver.execute_script 'mobile: tap', :x =>x.to_i, :y =>y.to_i
  end

end
