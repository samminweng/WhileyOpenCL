import java.io.File;
import java.util.HashMap;


public class TestOrganise {
	
	public static int getCount(String prefix, HashMap<String,Integer> prefixCount) {
		Integer count = prefixCount.get(prefix);
		if(count == null) {
			count = 1;
		} else {
			count = count + 1;			
		}
		prefixCount.put(prefix,count);
		return count;
	}
	
	public static void main(String[] args) {
		HashMap<String,Integer> prefixCount = new HashMap();
		File dir = new File(".");
		for(File f : dir.listFiles()) {
			String name = f.getName();
			if(name.endsWith("whiley")) {
				int end = name.indexOf("_");
				String prefix = name.substring(0,end);
				int count = getCount(prefix,prefixCount);
				String newName = prefix + "_Valid_" + count;
				System.out.println("MATCHED: " + name + " => " + newName);
				f.renameTo(new File(newName + ".whiley"));
				File outfile = new File(f.getName().replace("whiley","sysout"));
				if(outfile.exists()) {
					outfile.renameTo(new File(newName + ".sysout"));
				}
			}
		}
	}
}
