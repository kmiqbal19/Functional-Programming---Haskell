{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# OPTIONS_GHC -Wno-noncanonical-monad-instances #-}

import Control.Monad.Trans ( MonadTrans(..) )
import Control.Monad (liftM, ap)

newtype EitherTransformer m a = EitherTransformer { runEitherTransformer :: m (Either String a) }
  deriving (Functor)

instance MonadTrans EitherTransformer where
  lift :: Monad m => m a -> EitherTransformer m a
  lift ma = EitherTransformer $ fmap Right ma

instance Monad m => Applicative (EitherTransformer m) where
  pure :: Monad m => a -> EitherTransformer m a
  pure = EitherTransformer . return . Right

  (<*>) :: Monad m =>EitherTransformer m (a -> b)-> EitherTransformer m a -> EitherTransformer m b
  ef <*> ex = EitherTransformer $ do
    mf <- runEitherTransformer ef
    mx <- runEitherTransformer ex
    return (mf <*> mx)

instance Monad m => Monad (EitherTransformer m) where
  (>>=) :: Monad m => EitherTransformer m a -> (a -> EitherTransformer m b) -> EitherTransformer m b
  etma >>= f = EitherTransformer $ do
    result <- runEitherTransformer etma
    case result of
      Left err -> return (Left err)
      Right x  -> runEitherTransformer (f x)
  return :: Monad m => a -> EitherTransformer m a
  return = EitherTransformer . return . Right
