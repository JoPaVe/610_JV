llr = function(x, y, z, omega) {
	fits = sapply(z, compute_f_hat, x, y, omega)
	return(fits)
}

compute_f_hat = function(z, x, y, omega) {
  Wz = make_weight_matrix(z, x, omega)
  X = make_predictor_matrix(x)
  f_hat = c(1, z) %*% solve(t(X) %*%  apply(X,2,function(column) column * Wz)) %*% t(X) %*% apply(as.matrix(y),2,function(column) column * Wz)
  return(f_hat)
}

make_predictor_matrix = function(x) {
  return(cbind(rep(1,length(x)),x))
}

make_weight_matrix = function(z, x, omega) {
  r <- (abs(x-z))/omega
  r_vec <- sapply(r, FUN = function(r_count) {
    if (abs(r_count) < 1) {
      return_r <- (1-abs(r_count)^3)^3
      }
    else {return_r <- 0}
  return(return_r)
  })
  return(r_vec)
}
