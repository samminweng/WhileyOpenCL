import java.math.BigInteger;
import java.util.Iterator;
import wyjc.runtime.WyCollection;
import wyjc.runtime.WyLambda;
import wyjc.runtime.WyList;
import wyjc.runtime.WyRecord;

public final class TicTacToe100
{
  private static final BigInteger constant$0;
  private static final BigInteger constant$1;
  private static final BigInteger constant$2;
  private static final BigInteger constant$3;
  private static final WyList constant$4;
  
  static WyRecord EmptyBoard$Y9_FP8k0$J0FP$B5$J0FN$B5$J0kQ$J5$l$$B$$I0VF$w5$W0VR$F53y()
  {
    WyList localWyList2 = new WyList(0);
    WyList localWyList1 = localWyList2;
    Object localObject = localWyList1;
    BigInteger localBigInteger2 = constant$0;
    BigInteger localBigInteger3 = constant$3;
    WyList localWyList3 = WyList.range(localBigInteger2, localBigInteger3);
    Iterator localIterator = WyCollection.iterator(localWyList3);
    while (localIterator.hasNext())
    {
      BigInteger localBigInteger1 = (BigInteger)localIterator.next();
      BigInteger localBigInteger4 = constant$0;
      WyList localWyList4 = WyList.internal_add(new WyList(1), localBigInteger4);
      WyList localWyList5 = WyList.append((WyList)localObject, localWyList4);
      localObject = localWyList5;
    }
    BigInteger localBigInteger5 = constant$0;
    void tmp106_103 = new WyRecord();
    tmp106_103.put("move", localBigInteger5);
    void tmp115_106 = tmp106_103;
    tmp115_106.put("pieces", localObject);
    WyRecord localWyRecord = tmp115_106;
    return localWyRecord;
  }
  
  static WyRecord play$Z9dFXd_$6$F4$d0kN$F4$W0kN$F4$j0FO$32$k$$B4$10kQ$35$m0$OFc_$6$F4$d0kN$F4$W0kN$F4$j0FO$32$k$$B2$i0FN$Fr2(WyRecord paramWyRecord, BigInteger paramBigInteger)
  {
    BigInteger localBigInteger1 = (BigInteger)WyRecord.get(paramWyRecord, "move");
    BigInteger localBigInteger2 = constant$2;
    BigInteger localBigInteger3 = localBigInteger1.remainder(localBigInteger2);
    BigInteger localBigInteger4 = constant$0;
    if (localBigInteger3.equals(localBigInteger4))
    {
      BigInteger localBigInteger5 = constant$1;
      BigInteger localBigInteger6 = constant$1;
      paramWyRecord = WyRecord.put(paramWyRecord, "pieces", WyList.set((WyList)WyRecord.internal_get(paramWyRecord, "pieces"), paramBigInteger, localBigInteger6));
    }
    else
    {
      BigInteger localBigInteger7 = constant$2;
      BigInteger localBigInteger8 = constant$2;
      paramWyRecord = WyRecord.put(paramWyRecord, "pieces", WyList.set((WyList)WyRecord.internal_get(paramWyRecord, "pieces"), paramBigInteger, localBigInteger8));
    }
    BigInteger localBigInteger9 = (BigInteger)WyRecord.get(paramWyRecord, "move");
    BigInteger localBigInteger10 = constant$1;
    BigInteger localBigInteger11 = localBigInteger9.add(localBigInteger10);
    BigInteger localBigInteger12 = (BigInteger)WyRecord.get(paramWyRecord, "move");
    BigInteger localBigInteger13 = constant$1;
    BigInteger localBigInteger14 = localBigInteger12.add(localBigInteger13);
    paramWyRecord = WyRecord.put(paramWyRecord, "move", localBigInteger14);
    return paramWyRecord;
  }
  
  static BigInteger countOf$_9dF5u1FVY0d_$6$F4$d0kN$F4$W0kN$F4$j0FO$32$k$$B5$I0FR$J6$W0VR$Jq(WyList paramWyList, BigInteger paramBigInteger)
  {
    BigInteger localBigInteger4 = constant$0;
    BigInteger localBigInteger3 = localBigInteger4;
    Object localObject = localBigInteger3;
    BigInteger localBigInteger6 = WyCollection.length(paramWyList);
    BigInteger localBigInteger5 = localBigInteger6;
    BigInteger localBigInteger1 = localBigInteger5;
    BigInteger localBigInteger7 = constant$0;
    WyList localWyList = WyList.range(localBigInteger7, localBigInteger1);
    Iterator localIterator = WyCollection.iterator(localWyList);
    while (localIterator.hasNext())
    {
      BigInteger localBigInteger2 = (BigInteger)localIterator.next();
      BigInteger localBigInteger8 = (BigInteger)WyCollection.indexOf(paramWyList, localBigInteger2);
      if (localBigInteger8.equals(paramBigInteger))
      {
        BigInteger localBigInteger9 = constant$1;
        BigInteger localBigInteger10 = ((BigInteger)localObject).add(localBigInteger9);
        localObject = localBigInteger10;
      }
    }
    return (BigInteger)localObject;
  }
  
  static void main$2Ab737oHF4$i2$o$7C$N2Vm$7E$T0$q$7B$R2Vn$s4$a1Vw$ND$c2Vm$ch2VW$sC$R2Vt$sC$N2Vm1(WyRecord paramWyRecord)
  {
    WyRecord localWyRecord2 = EmptyBoard$Y9_FP8k0$J0FP$B5$J0FN$B5$J0kQ$J5$l$$B$$I0VF$w5$W0VR$F53y();
    WyRecord localWyRecord1 = localWyRecord2;
    Object localObject = localWyRecord1;
    BigInteger localBigInteger2 = constant$0;
    BigInteger localBigInteger3 = constant$3;
    WyList localWyList1 = WyList.range(localBigInteger2, localBigInteger3);
    Iterator localIterator = WyCollection.iterator(localWyList1);
    label194:
    label204:
    while (localIterator.hasNext())
    {
      BigInteger localBigInteger1 = (BigInteger)localIterator.next();
      BigInteger localBigInteger4 = constant$0;
      if (localBigInteger1.compareTo(localBigInteger4) >= 0)
      {
        BigInteger localBigInteger5 = constant$3;
        if (localBigInteger1.compareTo(localBigInteger5) <= 0)
        {
          WyList localWyList2 = (WyList)WyRecord.get((WyRecord)localObject, "pieces");
          BigInteger localBigInteger6 = (BigInteger)WyCollection.indexOf(localWyList2, localBigInteger1);
          BigInteger localBigInteger7 = constant$0;
          if (localBigInteger6.equals(localBigInteger7))
          {
            BigInteger localBigInteger8 = (BigInteger)WyRecord.get((WyRecord)localObject, "move");
            BigInteger localBigInteger9 = constant$3;
            if (!localBigInteger8.equals(localBigInteger9)) {
              break label194;
            }
          }
        }
      }
      WyRecord localWyRecord3 = (WyRecord)WyRecord.get(paramWyRecord, "out");
      WyLambda localWyLambda1 = (WyLambda)WyRecord.get(localWyRecord3, "println");
      WyList localWyList3 = constant$4;
      localWyLambda1.call(new Object[] { localWyList3 });
      break label204;
      WyRecord localWyRecord4 = play$Z9dFXd_$6$F4$d0kN$F4$W0kN$F4$j0FO$32$k$$B4$10kQ$35$m0$OFc_$6$F4$d0kN$F4$W0kN$F4$j0FO$32$k$$B2$i0FN$Fr2((WyRecord)localObject, localBigInteger1);
      localObject = localWyRecord4;
    }
    WyRecord localWyRecord5 = (WyRecord)WyRecord.get(paramWyRecord, "out");
    WyLambda localWyLambda2 = (WyLambda)WyRecord.get(localWyRecord5, "println");
    localWyLambda2.call(new Object[] { localObject });
  }
}
