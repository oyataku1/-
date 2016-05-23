function my_lin_interp(grid, vals)
    function func(x::Real)
        a=searchsortedfirst(grid, x)
        b=searchsortedlast(grid, x)
        if a==length(grid)+1||b==0
            return 0
        elseif a==1
            return vals[1]
        else
            return (vals[a]-vals[a-1])/(grid[a]-grid[a-1])*(x-grid[a-1])+vals[a-1]
        end
    end
    

    function func{T<:Real}(x::AbstractVector{T})
        n = length(x)
        out = Array(Float64, n)
        for i in 1:n
            out[i] = func(x[i])
        end
        return out
    end

    return func
end