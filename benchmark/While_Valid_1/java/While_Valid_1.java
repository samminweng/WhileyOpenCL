import java.math.BigInteger;
import java.util.Iterator;
import whiley.lang.Int;
import wyjc.runtime.WyCollection;
import wyjc.runtime.WyLambda;
import wyjc.runtime.WyList;
import wyjc.runtime.WyRecord;

public final class While_Valid_1
{
  private static final BigInteger constant$0 = BigInteger.valueOf(0);
  private static final BigInteger constant$1 = BigInteger.valueOf(1);
  private static final WyList constant$2 = tmp322_311;
  
  static WyList reverse$Z9bF1D527RWz(WyList paramWyList)
  {
    BigInteger localBigInteger2 = WyCollection.length(paramWyList);
    BigInteger localBigInteger1 = localBigInteger2;
    Object localObject1 = localBigInteger1;
    WyList localWyList2 = new WyList(0);
    WyList localWyList1 = localWyList2;
    WyList localWyList4;
    for (Object localObject2 = localWyList1;; localObject2 = localWyList4)
    {
      BigInteger localBigInteger3 = constant$0;
      if (((BigInteger)localObject1).compareTo(localBigInteger3) <= 0) {
        break;
      }
      BigInteger localBigInteger4 = constant$1;
      BigInteger localBigInteger5 = ((BigInteger)localObject1).subtract(localBigInteger4);
      localObject1 = localBigInteger5;
      BigInteger localBigInteger6 = (BigInteger)WyCollection.indexOf(paramWyList, localObject1);
      WyList localWyList3 = WyList.internal_add(new WyList(1), localBigInteger6);
      localWyList4 = WyList.append((WyList)localObject2, localWyList3);
    }
    return localObject2;
  }
  
  static void main$2Ab737oHF4$i2$o$7C$N2Vm$7E$T0$q$7B$R2Vn$s4$a1Vw$ND$c2Vm$ch2VW$sC$R2Vt$sC$N2Vm1(WyRecord paramWyRecord)
  {
    WyList localWyList2 = (WyList)WyRecord.get(paramWyRecord, "args");
    BigInteger localBigInteger2 = WyCollection.length(localWyList2);
    BigInteger localBigInteger3 = constant$0;
    if (localBigInteger2.equals(localBigInteger3))
    {
      WyRecord localWyRecord1 = (WyRecord)WyRecord.get(paramWyRecord, "out");
      WyLambda localWyLambda1 = (WyLambda)WyRecord.get(localWyRecord1, "println");
      WyList localWyList3 = constant$2;
      localWyLambda1.call(new Object[] { localWyList3 });
    }
    else
    {
      WyList localWyList4 = (WyList)WyRecord.get(paramWyRecord, "args");
      BigInteger localBigInteger4 = constant$0;
      WyList localWyList5 = (WyList)WyCollection.indexOf(localWyList4, localBigInteger4);
      Object localObject4 = Int.parse$a9bF5J7J0WL1d$kS$V5$d0$Q$J5$t0kA$k5$W0VQ$R5$j$FF$B4$20FH$ZZ0kR$F6$m0FP$s5$bCWAB(localWyList5);
      Object localObject3 = localObject4;
      Object localObject1 = localObject3;
      if (localObject1 == null)
      {
        localObject1 = localObject1;
      }
      else
      {
        localObject1 = (BigInteger)localObject1;
        WyList localWyList7 = new WyList(0);
        WyList localWyList6 = localWyList7;
        Object localObject2 = localWyList6;
        BigInteger localBigInteger5 = constant$0;
        WyList localWyList8 = WyList.range(localBigInteger5, (BigInteger)localObject1);
        Iterator localIterator = WyCollection.iterator(localWyList8);
        while (localIterator.hasNext())
        {
          BigInteger localBigInteger1 = (BigInteger)localIterator.next();
          WyList localWyList9 = WyList.internal_add(new WyList(1), localBigInteger1);
          WyList localWyList10 = WyList.append((WyList)localObject2, localWyList9);
          localObject2 = localWyList10;
        }
        WyList localWyList12 = reverse$Z9bF1D527RWz((WyList)localObject2);
        WyList localWyList11 = localWyList12;
        WyList localWyList1 = localWyList11;
        WyRecord localWyRecord2 = (WyRecord)WyRecord.get(paramWyRecord, "out");
        WyLambda localWyLambda2 = (WyLambda)WyRecord.get(localWyRecord2, "println");
        localWyLambda2.call(new Object[] { localWyList1 });
      }
    }
  }
}


/* Location:           E:\GitHub\WhileyOpenCLUpgrade\benchmark\While_Valid_1\java\
 * Qualified Name:     While_Valid_1
 * JD-Core Version:    0.7.0.1
 */