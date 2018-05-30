module SparseDistributions

export BinarySparse, Sparse

using Distributions

"""
    BinarySparse(n, k)

Create k-sparse vector. Each value is 0 or 1.
"""
function BinarySparse(n::Int64, k::Int64)
    x = cat(1, zeros(n - k), ones(k))
    shuffle(x)
end

"""
    BinarySparse(n, ρ)

Create k-sparse vector. k = trunc(ρ*n). Each value is 0 or 1.
"""
function BinarySparse(n::Int64, ρ::Float64)
    k = trunc(ρ*n)
    x = cat(1, zeros(n - k), ones(k))
    shuffle(x)
end

"""
    Sparse(n, ρ, distribution)

Create sparse vector (has type Array{Float64}, not type SparseArray) from distribution.
"""
function Sparse(n::Int64, ρ::Float64, distribution)
    k = trunc(ρ*n)
    x = cat(1, zeros(n - k), rand(distribution, k))
    shuffle(x)
end

end # module
