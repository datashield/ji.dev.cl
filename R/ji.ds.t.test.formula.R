#' 
#' @title Runs a student's t-test on horizontally partitioned data (formula method) NOT WORKING YET!!!!!!!!!!!
#' @description Performs two sample t-tests on vectors of data.
#' @param opals a list of opal object(s) obtained after login in to opal servers;
#' these objects hold also the data assign to R, as \code{dataframe}, from opal 
#' datasources.
#' @param formula a formula of the form y ~ x where y is a numeric variable giving the data values and x a factor with two levels giving the corresponding groups.
#' @param data an optional matrix or data frame containing the variables in the formula formula. By default the variables are taken from environment(formula)
#' @param subset an optional vector specifying a subset of observations to be used.
#' @param na.action a function which indicates what should happen when the data contain NAs. Defaults to getOption("na.action")
#' @param type a character which tells if the test is ran for the pooled data or not. 
#' By default \code{type} is set to 'combine' and a t.test of the pooled data is 
#' carried out. If \code{type} is set to 'split', a t.test is ran for each study separately.
#' @param alternative  character string specifying the alternative hypothesis, must be one of 
#' "two.sided" (default), "greater" or "less". You can specify just the initial letter.
#' @param mu a number indicating the true value of the mean (or difference in means if you are 
#' performing a two sample test).
#' @param paired a logical indicating whether you want a paired t-test.
#' @param var.equal a logical variable indicating whether to treat the two variances as being equal. 
#' If TRUE then the pooled variance is used to estimate the variance otherwise the Welch.
#' (or Satterthwaite) approximation to the degrees of freedom is used.
#' @param conf.level confidence level of the interval
#' @details Summary statistics are obtained from each of the data sets that are located on the 
#' distinct computers/servers. And then grand means and variances are calculated. Those are used 
#' for performing t-test.
#' @return a list containing the following elements:
#' \code{statistic} the value of the t-statistic 
#' \code{parameter} the degrees of freedom for the t-statistic 
#' \code{p.value} p.value the p-value for the test 
#' \code{conf.int} a confidence interval for the mean appropriate to the specified alternative hypothesis 
#' \code{estimate} the estimated mean or difference in means depending on whether it was a one-sample test or a two-sample test 
#' \code{null.value} the specified hypothesized value of the mean or mean difference depending on whether it was a one-sample test or a two-sample test 
#' \code{alternative} a character string describing the alternative hypothesis 
#' \code{method} a character string indicating what type of t-test was performed 
#' @author Isaeva, J.; Gaye, A.
#' @export
#' @examples
#' \dontrun{
#' # load that contains the login details
#' data(logindata)
#' 
#' # login and assign specific variable(s)
#' myvar <- list("LAB_TSC", "GENDER")
#' opals <- datashield.login(logins=logindata,assign=TRUE,variables=myvar)
#' 
#' # Example 1: Run a t.test of the pooled data for the variables 'LAB_HDL' and 'LAB_TSC' - default
#' ji.ds.t.test.formula(opals=opals, formula=D$LAB_TSC~D$GENDER)
#' 
#' # Example 2: Run a t.test for each study separately for the same variables as above
#' ji.ds.t.test.formula(opals=opals, formula=D$LAB_TSC~D$GENDER, type="split")
#'}
#'
ji.ds.t.test.formula <- function (opals, formula, data=NULL, subset=NULL, na.action=getOption('na.action'), type="combine", alternative = "two.sided", mu = 0, paired = FALSE, var.equal = FALSE, conf.level = 0.95) {
  
  # check whether the formula is correctly defined
  if (missing(formula) || (length(formula) != 3L) || (length(attr(terms(formula[-2L]), 
                                                                  "term.labels")) != 1L)) 
    stop("'formula' missing or incorrect")
  
  
  # get the names of the variables used for the analysis
  variables = all.names(formula)
  var1 = variables[1]
  var1 = variables[2]
  
  # ************************************************************* dont know yet how to do it here
  # call the function that checks the variables are available and not empty
#   vars2check <- list(x,y)
#   opals <- ds.checkvar(opals, vars2check)
  
  # number of studies
  num.sources = length(opals)
  
  if(type == "combine"){
    
    # Match given values and variables of the function
    m <- match.call(expand.dots = FALSE)
    print(m)
#     if (is.matrix(eval(m$data, parent.frame()))) 
#       m$data <- as.data.frame(data)
#     
#     if (is.matrix(eval(m$data, parent.frame()))) 
#       m$data <- as.data.frame(data)
#     m[[1L]] <- as.name("model.frame")
#     m$... <- NULL
#     mf <- eval(m, parent.frame())
#     DNAME <- paste(names(mf), collapse = " by ")
#     names(mf) <- NULL
#     response <- attr(attr(mf, "terms"), "response")
#     g <- factor(mf[[-response]])
#     if (nlevels(g) != 2L) 
#       stop("grouping factor must have exactly 2 levels")
#     DATA <- split(mf[[response]], g)
#     names(DATA) <- c("x", "y")
#     y <- do.call("t.test", c(DATA, list(...)))
#     y$data.name <- DNAME
#     if (length(y$estimate) == 2L) 
#       names(y$estimate) <- paste("mean in group", levels(g))
#     y
    
#     # Performs t-test on merged data sets
#     if (!missing(mu) && (length(mu) != 1 || is.na(mu))) 
#       stop("'mu' must be a single number")
#     if (!missing(conf.level) && (length(conf.level) != 1 || !is.finite(conf.level) || 
#                                    conf.level < 0 || conf.level > 1)) 
#       stop("'conf.level' must be a single number between 0 and 1")
#     if (!is.null(y)) {
#       if (paired) {
#         cally = call('complete.cases', x, y)
#         datashield.assign(opals, 'pair.compl.obs', cally)
#         cally = call('subset', x, quote(pair.compl.obs))
#         datashield.assign(opals, 'xok', cally)
#         cally = call('subset', y, quote(pair.compl.obs))
#         datashield.assign(opals, 'yok', cally)
#       } else {
#         cally = call('complete.cases', x)
#         datashield.assign(opals, 'not.na.x', cally)
#         cally = call('subset', x, quote(not.na.x))
#         datashield.assign(opals, 'xok', cally)
#         cally = call('complete.cases', y)
#         datashield.assign(opals, 'not.na.y', cally)
#         cally = call('subset', y, quote(not.na.y))
#         datashield.assign(opals, 'yok', cally)
#       }
#     } else {
#       # dname <- deparse(substitute(x))
#       if (paired) 
#         stop("'y' is missing for paired test")
#       cally = call('complete.cases', x)
#       datashield.assign(opals, 'not.na.x', cally)
#       cally = call('subset', x, quote(not.na.x))
#       datashield.assign(opals, 'xok', cally)
#     }
#     
#     
#     if (paired) {
#       cally = call('product.ds', quote(yok), quote(-1))
#       datashield.assign(opals, 'minus_y', cally)
#       datashield.assign(opals, 'xok', quote(sum(xok, minus_y)))
#       datashield.assign(opals, 'yok', quote(as.null(yok)))
#     }
#     
#     length.local.x = datashield.aggregate(opals, quote(NROW(xok)))
#     mean.local.x = datashield.aggregate(opals, quote(mean.ds(xok)))
#     var.local.x = datashield.aggregate(opals, quote(var(xok)))
#     
#     length.total.x = 0
#     sum.weighted.x = 0
#     
#     for (i in 1:num.sources) 
#       if (!is.null(length.local.x[[i]]))
#         length.total.x = length.total.x + length.local.x[[i]]
#     
#     for (i in 1:num.sources) 
#       if (!is.null(length.local.x[[i]]))
#         sum.weighted.x = sum.weighted.x + length.local.x[[i]]*mean.local.x[[i]]
#     
#     if (!is.na(sum.weighted.x))
#       mean.global.x = sum.weighted.x/length.total.x else
#         stop(paste("Check the data supplied: global ", variables[1], " mean is NA", sep=""))
#     estimate = mean.global.x
#     
#     nrows_var.x = NROW(var.local.x[[1]])
#     ncols_var.x = NCOL(var.local.x[[1]])
#     dummy.sum.x = matrix(0, nrows_var.x, ncols_var.x)
#     
#     for (i in 1:num.sources) {
#       if (!is.null(var.local.x[[i]]) & !is.null(mean.local.x[[i]]))
#         if (!is.na(var.local.x[[i]]) & !is.na(mean.local.x[[i]])) {
#           var.weight.x = (length.local.x[[i]]-1)*var.local.x[[i]]
#           add.elem.x = length.local.x[[i]]*(mean.local.x[[i]]%x%t(mean.local.x[[i]]))
#           dummy.sum.x = dummy.sum.x +var.weight.x+add.elem.x
#         }      
#     }
#     mean.global.products.x = length.total.x*(mean.global.x%x%t(mean.global.x))
#     var.global.x = 1/(length.total.x-1)*(dummy.sum.x-mean.global.products.x)
#     
#     null.y = datashield.aggregate(opals, quote(is.null(yok)))
#     null.y = unlist(null.y)
#     
#     if (all(null.y)) {
#       if (length.total.x < 2) 
#         stop("not enough 'x' observations")
#       df <- length.total.x - 1
#       stderr <- sqrt(var.global.x/length.total.x)
#       if (stderr < 10 * .Machine$double.eps * abs(mean.global.x)) 
#         stop("data are essentially constant")
#       tstat <- (mean.global.x - mu)/stderr
#       method <- ifelse(paired, "Paired t-test", "One Sample t-test")
#       names(estimate) <- ifelse(paired, "mean of the differences", paste("mean of", variables[1], sep=""))
#     } else {
#       length.local.y = datashield.aggregate(opals, quote(NROW(yok)))
#       
#       length.total.y = 0
#       sum.weighted.y = 0
#       
#       for (i in 1:num.sources) 
#         if (!is.null(length.local.y[[i]]))
#           length.total.y = length.total.y + length.local.y[[i]]
#       
#       if (length.total.x < 1 || (!var.equal && length.total.x < 2)) 
#         stop(paste("not enough ", variables[1], "observations", sep=""))
#       if (length.total.y < 1 || (!var.equal && length.total.y < 2)) 
#         stop(paste("not enough ", variables[2], "observations", sep=""))
#       if (var.equal && length.total.x + length.total.y < 3) 
#         stop("not enough observations")
#       
#       mean.local.y = datashield.aggregate(opals, quote(mean.ds(yok)))
#       var.local.y = datashield.aggregate(opals, quote(var(yok)))
#       method <- paste(if (!var.equal) 
#         "Welch", "Two Sample t-test")
#       
#       length.total.y = 0
#       sum.weighted.y = 0
#       
#       for (i in 1:num.sources) 
#         if (!is.null(length.local.y[[i]])) {
#           length.total.y = length.total.y + length.local.y[[i]]
#           sum.weighted.y = sum.weighted.y + length.local.y[[i]]*mean.local.y[[i]]
#         }
#       if (!is.na(sum.weighted.y))
#         mean.global.y = sum.weighted.y/length.total.y else
#           stop(paste("Check the data supplied: global ", variables[2], " mean is NA", sep=""))
#       
#       estimate <- c(mean.global.x, mean.global.y)
#       names(estimate) <- c(paste("mean of ", variables[1], sep=""), paste("mean of ", variables[2], sep=""))
#       
#       nrows_var.y = NROW(var.local.y[[1]])
#       ncols_var.y = NCOL(var.local.y[[1]])
#       dummy.sum.y = matrix(0, nrows_var.y, ncols_var.y)
#       
#       for (i in 1:num.sources) {
#         if (!is.null(var.local.y[[i]]) & !is.null(mean.local.y[[i]]))
#           if (!is.na(var.local.y[[i]]) & !is.na(mean.local.y[[i]])) {
#             var.weight.y = (length.local.y[[i]]-1)*var.local.y[[i]]
#             add.elem.y = length.local.y[[i]]*(mean.local.y[[i]]%x%t(mean.local.y[[i]]))
#             dummy.sum.y = dummy.sum.y +var.weight.y+add.elem.y
#           }      
#       }
#       mean.global.products.y = length.total.y*(mean.global.y%x%t(mean.global.y))
#       var.global.y = 1/(length.total.y-1)*(dummy.sum.y-mean.global.products.y)
#       
#       if (var.equal) {
#         df <- length.total.x + length.total.x - 2
#         v <- 0
#         if (length.total.x > 1) 
#           v <- v + (length.total.x - 1) * var.global.x
#         if (length.total.y > 1) 
#           v <- v + (length.total.y - 1) * var.global.y
#         v <- v/df
#         stderr <- sqrt(v * (1/length.total.x + 1/length.total.y))
#       } else {
#         stderrx <- sqrt(var.global.x/length.total.x)
#         stderry <- sqrt(var.global.y/length.total.y)
#         stderr <- sqrt(stderrx^2 + stderry^2)
#         df <- stderr^4/(stderrx^4/(length.total.x - 1) + stderry^4/(length.total.y - 1))
#       }
#       if (stderr < 10 * .Machine$double.eps * max(abs(mean.global.x), 
#                                                   abs(mean.global.y))) 
#         stop("data are essentially constant")
#       tstat <- (mean.global.x - mean.global.y - mu)/stderr
#     }
#     
#     
#     if (alternative == "less") {
#       pval <- pt(tstat, df)
#       cint <- c(-Inf, tstat + qt(conf.level, df))
#     } else if (alternative == "greater") {
#       pval <- pt(tstat, df, lower.tail = FALSE)
#       cint <- c(tstat - qt(conf.level, df), Inf)
#     } else {
#       pval <- 2 * pt(-abs(tstat), df)
#       alpha <- 1 - conf.level
#       cint <- qt(1 - alpha/2, df)
#       cint <- tstat + c(-cint, cint)
#     }
#     cint <- mu + cint * stderr
#     names(tstat) <- "t"
#     names(df) <- "df"
#     names(mu) <- if (paired || !is.null(y)) 
#       "difference in means" else
#         "mean"
#     attr(cint, "conf.level") <- conf.level
#     rval <- list(statistic = tstat, parameter = df, p.value = pval, 
#                  conf.int = cint, estimate = estimate, null.value = mu, 
#                  alternative = alternative, method = method)
#     class(rval) <- "htest"
#     
#     # delete files that are no more required
#     datashield.rm(opals, 'pair.compl.obs')
#     datashield.rm(opals, 'xok')
#     datashield.rm(opals, 'yok')
#     datashield.rm(opals, 'not.na.x')
#     datashield.rm(opals, 'minus_y')  
#     
#     return(rval)
    
  }else{
    if(type == "split"){
      cally <- call("t.test", formula, data, subset, na.action, alternative=alternative, mu=mu, 
                    paired=paired, var.equal=var.equal, conf.level=conf.level) 
      results <- datashield.aggregate(opals, cally)
      return(results)
    }else{
      stop('Function argument "type" has to be either "combine" or "split"')
    }
  }
}
