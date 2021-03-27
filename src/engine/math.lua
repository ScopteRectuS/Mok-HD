math.parabola = function(maxHeight, maxRange, currentRange)
    return (4 * maxHeight / maxRange) * (maxRange - currentRange) * (currentRange / maxRange)
end
