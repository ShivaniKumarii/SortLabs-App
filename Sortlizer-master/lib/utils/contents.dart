import 'package:sorting_visualizer/datamodels/algorithmType.dart';

class DataContent {
  Map<AlgorithmType, String> algorithmsMap = {
    AlgorithmType.BUBBLE_SORT: "Bubble Sort",
    AlgorithmType.INSERTION_SORT: "Insertion Sort",
    AlgorithmType.SELECTION_SORT: "Selection Sort",
    AlgorithmType.MERGE_SORT: "Merge Sort",
    AlgorithmType.QUICK_SORT: "Quick Sort",
    AlgorithmType.CYCLE_SORT: "Cycle Sort",
    AlgorithmType.RADIX_SORT: "Radix Sort",
    AlgorithmType.COCKTAIL_SORT: "Cocktail Sort",
    AlgorithmType.ODD_EVEN_SORT: "Odd Even Sort",
    AlgorithmType.HEAP_SORT: "Heap Sort",
    AlgorithmType.SHELL_SORT: "Shell Sort",
    AlgorithmType.BEAD_SORT: "Bead Sort",
    AlgorithmType.GNOME_SORT: "Gnome Sort"
  };

  String getAlgorithmTitle(AlgorithmType type) {
    return algorithmsMap[type]!;
  }

  AlgorithmType getAlgorithmType(String algo) {
    var idx = getAlgorithms().indexOf(algo);
    var entryList = algorithmsMap.entries.toList();
    return entryList[idx].key;
  }

  List<String> getAlgorithms() {
    return algorithmsMap.values.toList();
  }

  String getDescription(AlgorithmType type) {
    var algoDesc = {
      AlgorithmType.BUBBLE_SORT:
          "Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements of the array if they are in the wrong order.\n\n" +
              "Eg., arr[2] = 12 & arr[3] = 5\n" +
              "Now, arr[2] > arr[3], so swap: arr[2] = 5 & arr[3] = 12",
      AlgorithmType.INSERTION_SORT:
          "Insertion Sort is a simple sorting algorithm that builds the sorted array one element at a time. The elements from the unsorted part are picked and placed at the correct position in the sorted part.",
      AlgorithmType.SELECTION_SORT:
          "The selection sort algorithm sorts an array by repeatedly finding the minimum element from the unsorted part and putting it at the beginning of the array.",
      AlgorithmType.MERGE_SORT:
          "Merge Sort is a divide and conquer algorithm. Which first divides the given input array into two halves, calling itself for the two halves, and then merging the two sorted halves.",
      AlgorithmType.QUICK_SORT:
          "QuickSort is a divide and conquer algorithm, which picks an element from the given array as a pivot and partitions the given array around the chosen pivot.",
      AlgorithmType.CYCLE_SORT:
          "Cycle sort is an in-place sorting algorithm, unstable sorting algorithm, a comparison sort that is theoretically optimal in terms of the total number of writes to the original array, unlike any other in-place sorting algorithm.",
      AlgorithmType.RADIX_SORT:
          "Radix sort is a sorting algorithm that avoids comparison and sorts the elements by first grouping or creating buckets of the individual digits of the same place value. Then, sorting the elements according to their increasing/decreasing order.",
      AlgorithmType.COCKTAIL_SORT:
          "Cocktail Sort is a variation of Bubble sort. The Bubble sort algorithm always traverses elements from left and moves the largest element to its correct position in the first iteration and second-largest in the second iteration and so on. Cocktail Sort traverses through a given array in both directions alternatively.",
      AlgorithmType.ODD_EVEN_SORT:
          "Odd-Even sort algorithm is divided into two phases - Odd and the Even Phase. The algorithm runs until the array elements are sorted and in each iteration, two phases occur- Odd and Even Phases. In the odd phase, we perform a bubble sort on odd indexed elements, and in the even phase, we perform a bubble sort on even indexed elements.",
      AlgorithmType.HEAP_SORT:
          "Heap Sort is a comparison-based sorting technique based on Binary Heap data structure. It is similar to selection sort but much improved where it maintains the unsorted region in a heap data structure to more quickly find the largest element in each step and place the element at the end.",
      AlgorithmType.SHELL_SORT:
          "Shell sort is a generalized version of the insertion sort algorithm. It first sorts elements that are far apart from each other and successively reduces the interval between the elements to be sorted.",
      AlgorithmType.BEAD_SORT:
          "Also known as Gravity sort, this algorithm was inspired by natural phenomenons and was designed keeping in mind-objects (or beads) falling under the influence of gravity. Both digital and analog hardware implementations of bead sort can achieve a sorting time of O(n); however, the implementation of this algorithm tends to be significantly slower in software and can only be used to sort lists of positive integers.",
      AlgorithmType.GNOME_SORT:
          "Gnome Sort is a sorting algorithm that is similar to Insertion sort in that it works with one item at a time but gets the item to the proper place by a series of swaps, similar to a Bubble sort."
    };

    return algoDesc.containsKey(type) ? algoDesc[type]! : "N.A";
  }

  List<String> getTimeComplexities(AlgorithmType type) {
    // [Worst, Avg, Best]
    var complexities = {
      AlgorithmType.BUBBLE_SORT: ["O(n²)", "O(n²)", "O(n)"],
      AlgorithmType.INSERTION_SORT: ["O(n²)", "O(n²)", "O(n)"],
      AlgorithmType.SELECTION_SORT: ["O(n²)", "O(n²)", "O(n²)"],
      AlgorithmType.MERGE_SORT: ["O(nlogn)", "O(nlogn)", "O(nlogn)"],
      AlgorithmType.QUICK_SORT: ["O(n²)", "O(nlgon)", "O(nlogn)"],
      AlgorithmType.CYCLE_SORT: ["O(n²)", "O(n²)", "O(n²)"],
      AlgorithmType.RADIX_SORT: ["O(n+k)", "O(n+k)", "O(n+k)"],
      AlgorithmType.COCKTAIL_SORT: ["O(n²)", "O(n²)", "O(n)"],
      AlgorithmType.ODD_EVEN_SORT: ["O(n²)", "O(n²)", "O(n)"],
      AlgorithmType.HEAP_SORT: ["O(nlogn)", "O(nlogn)", "O(nlogn)"],
      AlgorithmType.SHELL_SORT: ["O(n²)", "O(nlogn)", "O(nlogn)"],
      // AlgorithmType.BEAD_SORT: ["O(S)", "O(√n)", "O(1)"],
      AlgorithmType.GNOME_SORT: ["O(n²)", "O(n²)", "O(n)"],
    };
    return complexities.containsKey(type)
        ? complexities[type]!
        : ["N.A.", "N.A.", "N.A."];
  }

  String getSpaceComplexity(AlgorithmType type) {
    // Worst Cases
    var complexities = {
      AlgorithmType.BUBBLE_SORT: "O(1)",
      AlgorithmType.INSERTION_SORT: "O(1)",
      AlgorithmType.SELECTION_SORT: "O(1)",
      AlgorithmType.MERGE_SORT: "O(n)",
      AlgorithmType.QUICK_SORT: "O(logn)",
      AlgorithmType.CYCLE_SORT: "O(1)",
      AlgorithmType.RADIX_SORT: "O(n+k)",
      AlgorithmType.COCKTAIL_SORT: "O(1)",
      AlgorithmType.ODD_EVEN_SORT: "O(1)",
      AlgorithmType.HEAP_SORT: "O(1)",
      AlgorithmType.SHELL_SORT: "O(1)",
      AlgorithmType.BEAD_SORT: "O(n²)",
      AlgorithmType.GNOME_SORT: "O(1)",
    };
    return complexities.containsKey(type) ? complexities[type]! : "N.A";
  }

  String algoExtraInfo(AlgorithmType type) {
    if (type == AlgorithmType.BEAD_SORT) {
      return "4 general levels of complexity:\n\n" +
          "1. O(1): Beads moved simultaneously as a single operation. This complexity cannot be implemented in practice.\n" +
          "2. O(√n): In a realistic physical model that uses gravity, the time it takes to let the beads fall is proportional to the square root of the maximum height, which is proportional to n.\n" +
          "3. O(n): Dropping the row of beads in the frame (representing a number) as a distinct operation since the number of rows is equal to n.\n" +
          "4. O(S): S is the sum of all the beads. Each bead is moved separately.";
    }
    return "";
  }

  String getAlgorithmCode(AlgorithmType type) {
    switch (type) {
      case AlgorithmType.BUBBLE_SORT:
        return bubbleSortCode();
      case AlgorithmType.INSERTION_SORT:
        return insertionSortCode();
      case AlgorithmType.SELECTION_SORT:
        return selectionSortCode();
      case AlgorithmType.MERGE_SORT:
        return mergeSortCode();
      case AlgorithmType.QUICK_SORT:
        return quickSortCode();
      case AlgorithmType.CYCLE_SORT:
        return cycleSortCode();
      case AlgorithmType.RADIX_SORT:
        return radixSortCode();
      case AlgorithmType.COCKTAIL_SORT:
        return cocktailSortCode();
      case AlgorithmType.ODD_EVEN_SORT:
        return oddEvenSortCode();
      case AlgorithmType.HEAP_SORT:
        return heapSortCode();
      case AlgorithmType.SHELL_SORT:
        return shellSortCode();
      case AlgorithmType.BEAD_SORT:
        return beadSortCode();
      case AlgorithmType.GNOME_SORT:
        return gnomeSortCode();
      default:
        return "";
    }
  }

  String bubbleSortCode() {
    return """
public class BubbleSortExample {  
    static void bubbleSort(int[] arr) {  
        int n = arr.length;  
        int temp = 0;  
         for(int i=0; i < n; i++){  
                 for(int j=1; j < (n-i); j++){  
                          if(arr[j-1] > arr[j]){  
                                 //swap elements  
                                 temp = arr[j-1];  
                                 arr[j-1] = arr[j];  
                                 arr[j] = temp;  
                         }  
                          
                 }  
         }  
  
    }  
    public static void main(String[] args) {  
                int arr[] ={3,60,35,2,45,320,5};  
                 
                System.out.println("Array Before Bubble Sort");  
                for(int i=0; i < arr.length; i++){  
                        System.out.print(arr[i] + " ");  
                }  
                System.out.println();  
                  
                bubbleSort(arr);//sorting array elements using bubble sort  
                 
                System.out.println("Array After Bubble Sort");  
                for(int i=0; i < arr.length; i++){  
                        System.out.print(arr[i] + " ");  
                }  
   
        }  
}  
      """;
  }

  String insertionSortCode() {
    return """

public class InsertionSort {
	void sort(int arr[])
	{
		int n = arr.length;
		for (int i = 1; i < n; ++i) {
			int key = arr[i];
			int j = i - 1;

			while (j >= 0 && arr[j] > key) {
				arr[j + 1] = arr[j];
				j = j - 1;
			}
			arr[j + 1] = key;
		}
	}

	static void printArray(int arr[])
	{
		int n = arr.length;
		for (int i = 0; i < n; ++i)
			System.out.print(arr[i] + " ");

		System.out.println();
	}

	// Driver method
	public static void main(String args[])
	{
		int arr[] = { 12, 11, 13, 5, 6 };

		InsertionSort ob = new InsertionSort();
		ob.sort(arr);

		printArray(arr);
	}
};
    """;
  }

  String selectionSortCode() {
    return """
public class SelectionSortExample {  
    public static void selectionSort(int[] arr){  
        for (int i = 0; i < arr.length - 1; i++)  
        {  
            int index = i;  
            for (int j = i + 1; j < arr.length; j++){  
                if (arr[j] < arr[index]){  
                    index = j;//searching for lowest index  
                }  
            }  
            int smallerNumber = arr[index];   
            arr[index] = arr[i];  
            arr[i] = smallerNumber;  
        }  
    }  
       
    public static void main(String a[]){  
        int[] arr1 = {9,14,3,2,43,11,58,22};  
        System.out.println("Before Selection Sort");  
        for(int i:arr1){  
            System.out.print(i+" ");  
        }  
        System.out.println();  
          
        selectionSort(arr1);//sorting array using selection sort  
         
        System.out.println("After Selection Sort");  
        for(int i:arr1){  
            System.out.print(i+" ");  
        }  
    }  
}  
    """;
  }

  String mergeSortCode() {
    return """
 void merge(int a[], int beg, int mid, int end)    
{    
    int i, j, k;  
    int n1 = mid - beg + 1;    
    int n2 = end - mid;    
      
    int LeftArray[n1], RightArray[n2]; //temporary arrays  
      
    /* copy data to temp arrays */  
    for (int i = 0; i < n1; i++)    
    LeftArray[i] = a[beg + i];    
    for (int j = 0; j < n2; j++)    
    RightArray[j] = a[mid + 1 + j];    
      
    i = 0, /* initial index of first sub-array */  
    j = 0; /* initial index of second sub-array */   
    k = beg;  /* initial index of merged sub-array */  
      
    while (i < n1 && j < n2)    
    {    
        if(LeftArray[i] <= RightArray[j])    
        {    
            a[k] = LeftArray[i];    
            i++;    
        }    
        else    
        {    
            a[k] = RightArray[j];    
            j++;    
        }    
        k++;    
    }    
    while (i<n1)    
    {    
        a[k] = LeftArray[i];    
        i++;    
        k++;    
    }    
      
    while (j<n2)    
    {    
        a[k] = RightArray[j];    
        j++;    
        k++;    
    }    
}    
    """;
  }

  String quickSortCode() {
    return """
import java.util.Arrays;

class Quicksort {

  // method to find the partition position
  static int partition(int array[], int low, int high) {
    
    // choose the rightmost element as pivot
    int pivot = array[high];
    
    // pointer for greater element
    int i = (low - 1);

    // traverse through all elements
    // compare each element with pivot
    for (int j = low; j < high; j++) {
      if (array[j] <= pivot) {

        // if element smaller than pivot is found
        // swap it with the greater element pointed by i
        i++;

        // swapping element at i with element at j
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
      }

    }

    // swapt the pivot element with the greater element specified by i
    int temp = array[i + 1];
    array[i + 1] = array[high];
    array[high] = temp;

    // return the position from where partition is done
    return (i + 1);
  }

  static void quickSort(int array[], int low, int high) {
    if (low < high) {

      // find pivot element such that
      // elements smaller than pivot are on the left
      // elements greater than pivot are on the right
      int pi = partition(array, low, high);
      
      // recursive call on the left of pivot
      quickSort(array, low, pi - 1);

      // recursive call on the right of pivot
      quickSort(array, pi + 1, high);
    }
  }
}

class Main {
  public static void main(String args[]) {

    int[] data = { 8, 7, 2, 1, 0, 9, 6 };
    System.out.println("Unsorted Array");
    System.out.println(Arrays.toString(data));

    int size = data.length;
    Quicksort.quickSort(data, 0, size - 1);

    System.out.println("Sorted Array in Ascending Order ");
    System.out.println(Arrays.toString(data));
  }
}
    """;
  }

  String cycleSortCode() {
    return """
class CycleSort   
{  
/*function to implement to cycle sort*/  
static void cycleSort(int a[], int n)    
{    
    int start, element, pos, temp, i;    
     
   /*Loop to traverse the array elements and place them on the correct  
 
position*/  
    for (start = 0; start <= n - 2; start++) {    
        element = a[start];  
          
        /*position to place the element*/  
        pos = start;    
          
        for (i = start + 1; i < n; i++)    
            if (a[i] < element)    
                pos++;    
        if (pos == start)  /*if the element is at exact position*/  
            continue;    
        while (element == a[pos])    
            pos += 1;    
        if (pos != start) /*put element at its exact position*/   
        {    
            //swap(element, a[pos]);    
            temp = element;    
            element = a[pos];    
            a[pos] = temp;      
        }    
        /*Rotate rest of the elements*/  
        while (pos != start)   
        {    
            pos = start;    
            /*find position to put the element*/  
            for (i = start + 1; i < n; i++)    
                if (a[i] < element)    
                    pos += 1;    
              
            /*Ignore duplicate elements*/  
            while (element == a[pos])    
                pos += 1;    
              
            /*put element to its correct position*/  
            if (element != a[pos])   
            {    
                temp = element;    
                element = a[pos];    
                a[pos] = temp;      
            }    
        }    
    }    
     
 }    
   
  static void print(int a[], int n) /*function to print array elements*/  
    {  
    int i;  
    for(i = 0; i < n; i++)    
    {    
        System.out.print(a[i] + " ");    
    }        
    }  
  
     
public static void main(String args[])   
   {  
    int[] a = {87, 42, 27, 17, 7, 37, 57, 47, 2, 1};    
    int n = a.length;    
    System.out.print("Before sorting array elements are - \n");  
    print(a, n);  
    cycleSort(a, n);    
    System.out.print("\nAfter applying cycle sort, array elements are - \n");    
    print(a, n);  
}  
  
}  
    """;
  }

  String radixSortCode() {
    return """
public class RadixSort {

    public static void sort(int[] arr) {
        // Find the maximum number in the array.
        int max = arr[0];
        for (int i = 1; i < arr.length; i++) {
            if (arr[i] > max) {
                max = arr[i];
            }
        }

        // Sort the array using radix sort.
        for (int d = 1; d <= max; d *= 10) {
            countSort(arr, d);
        }
    }

    private static void countSort(int[] arr, int d) {
        // Create a count array.
        int[] count = new int[10];

        // Increment the count array based on the digits of the array elements.
        for (int i = 0; i < arr.length; i++) {
            count[arr[i] / d]++;
        }

        // Prefix sum the count array.
        for (int i = 1; i < count.length; i++) {
            count[i] += count[i - 1];
        }

        // Reconstruct the sorted array.
        for (int i = arr.length - 1; i >= 0; i--) {
            arr[count[arr[i] / d] - 1] = arr[i];
            count[arr[i] / d]--;
        }
    }
}
    """;
  }

  String cocktailSortCode() {
    return """
public class CocktailSort
{
	void cocktailSort(int a[])
	{
		boolean swapped = true;
		int start = 0;
		int end = a.length;

		while (swapped == true)
		{
			swapped = false;
			for (int i = start; i < end - 1; ++i)
			{
				if (a[i] > a[i + 1]) {
					int temp = a[i];
					a[i] = a[i + 1];
					a[i + 1] = temp;
					swapped = true;
				}
			}
			if (swapped == false)
				break;
			swapped = false;
			end = end - 1;
			
			for (int i = end - 1; i >= start; i--)
			{
				if (a[i] > a[i + 1])
				{
					int temp = a[i];
					a[i] = a[i + 1];
					a[i + 1] = temp;
					swapped = true;
				}
			}
			start = start + 1;
		}
	}
	void printArray(int a[])
	{
		int n = a.length;
		for (int i = 0; i < n; i++)
			System.out.print(a[i] + " ");
		System.out.println();
	}
	
	public static void main(String[] args)
	{
		CocktailSort ob = new CocktailSort();
		int a[] = { 5, 1, 4, 2, 8, 0, 2 };
		ob.cocktailSort(a);
		System.out.println("Sorted array");
		ob.printArray(a);
	}
}

    """;
  }

  String oddEvenSortCode() {
    return """

import java.io.*;

class GFG
{
	public static void oddEvenSort(int arr[], int n)
	{
		boolean isSorted = false; // Initially array is unsorted

		while (!isSorted)
		{
			isSorted = true;
			int temp =0;

			// Perform Bubble sort on odd indexed element
			for (int i=1; i<=n-2; i=i+2)
			{
				if (arr[i] > arr[i+1])
				{
					temp = arr[i];
					arr[i] = arr[i+1];
					arr[i+1] = temp;
					isSorted = false;
				}
			}

			// Perform Bubble sort on even indexed element
			for (int i=0; i<=n-2; i=i+2)
			{
				if (arr[i] > arr[i+1])
				{
					temp = arr[i];
					arr[i] = arr[i+1];
					arr[i+1] = temp;
					isSorted = false;
				}
			}
		}

		return;
	}
	public static void main (String[] args)
	{
		int arr[] = {34, 2, 10, -9};
		int n = arr.length;

		oddEvenSort(arr, n);
		for (int i=0; i < n; i++)
			System.out.print(arr[i] + " ");

		System.out.println(" ");
	}
}

    """;
  }

  String heapSortCode() {
    return """
public class HeapSort {

    public static void heapSort(int[] arr) {
        for (int i = arr.length / 2; i >= 0; i--) {
            heapify(arr, i);
        }
        for (int i = arr.length - 1; i >= 1; i--) {
            swap(arr, 0, i);
            heapify(arr, 0);
        }
    }

    private static void heapify(int[] arr, int i) {
        int leftChild = 2 * i + 1;
        int rightChild = 2 * i + 2;

        int maxIndex = i;
        if (leftChild < arr.length && arr[leftChild] > arr[i]) {
            maxIndex = leftChild;
        }
        if (rightChild < arr.length && arr[rightChild] > arr[maxIndex]) {
            maxIndex = rightChild;
        }
        if (maxIndex != i) {
            swap(arr, i, maxIndex);
            heapify(arr, maxIndex);
        }
    }

    private static void swap(int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}
    """;
  }

  String shellSortCode() {
    return """
public class ShellSort {

    public static void sort(int[] arr) {
        int n = arr.length;

        int gap = n / 2;
        while (gap > 0) {
            for (int i = 0; i < n; i++) {
                int currentElement = arr[i];
                int elementAtGapIndex = arr[i - gap];
                if (currentElement < elementAtGapIndex) {
                    // Swap the two elements
                    int temp = currentElement;
                    arr[i] = elementAtGapIndex;
                    arr[i - gap] = temp;
                }
            }
            gap /= 2;
        }
    }
}  """;
  }

  String beadSortCode() {
    return """
public class BeadSort {
	public static void beadSort(int[] a)
	{
		int max = a[0];
		for (int i = 1; i < a.length; i++) {
			if (a[i] > max) {
				max = a[i];
			}
		}

	
		int[][] beads = new int[a.length][max];

		for (int i = 0; i < a.length; i++) {
			for (int j = 0; j < a[i]; j++) {
				beads[i][j] = 1;
			}
		}
		for (int j = 0; j < max; j++) {
			int sum = 0;
			for (int i = 0; i < a.length; i++) {
				sum += beads[i][j];
				beads[i][j] = 0;
			}

			for (int i = a.length - 1; i >= a.length - sum;
				i--) {
				a[i] = j + 1;
			}
		}
	}

	public static void main(String[] args)
	{
		int[] a = { 4, 2, 6, 1, 8 };
		beadSort(a);
		for (int i : a) {
			System.out.print(i + " ");
		}
	}
}

    """;
  }

  String gnomeSortCode() {
    return """

import java.util.Arrays; 
public class GFG { 
	static void gnomeSort(int arr[], int n) 
	{ 
		int index = 0; 

		while (index < n) { 
			if (index == 0) 
				index++; 
			if (arr[index] >= arr[index - 1]) 
				index++; 
			else { 
				int temp = 0; 
				temp = arr[index]; 
				arr[index] = arr[index - 1]; 
				arr[index - 1] = temp; 
				index--; 
			} 
		} 
		return; 
	} 
	
	public static void main(String[] args) 
	{ 
		int arr[] = { 34, 2, 10, -9 }; 

		gnomeSort(arr, arr.length); 

		System.out.print("Sorted sequence after applying Gnome sort: "); 
		System.out.println(Arrays.toString(arr)); 
	} 
} 
    """;
  }
}
