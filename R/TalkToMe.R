TalkToMe <- function()
{
  print("Hello! I am TalkeR.")
  print("If I make an incorrect response please type 'wrong'")
  print("and then correct me.")
  response <- "foo"
  while(1<2)
  {
    response <- readline(prompt="Your Response1:")
    if(response == "bye")
    {
      break
    }
    if("brain.csv" %in% list.files())
    {
      brain <- read.csv("brain.csv")
    }else{
      brain <- data.frame(matrix(nrow=0,ncol=2))
      colnames(brain) <- c("UserInput","Reply")
    }
    brain <- unique(brain)
    if(response %in% brain$UserInput && response != "wrong")
    {
      reply <- brain[which(brain$UserInput == response),2]
      print(reply)
    }else if((response %in% brain$UserInput == F) && response != "wrong"){
      reply <- response
      storedresponse <- response
      novo <- data.frame(reply,response)
      colnames(novo) <- colnames(brain)
      brain <- rbind(brain,novo)
      print(reply)
    }else{
      goodresponse <- readline(prompt="What should I have said?: ")
      oldlevs <- levels(brain[,2])
      newlevs <- c(oldlevs,goodresponse)
      levels(brain[,2]) <- newlevs
      brain[which(brain$UserInput == storedresponse),2] <- goodresponse
      print("Thanks! I'll say that from now on.")
    }
    write.csv(brain,"brain.csv",row.names=F)
  }
}
