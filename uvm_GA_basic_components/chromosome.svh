/* *****************************************************************************
 * Project Name: HAVEN - Genetic Algorithm
 * File Name:    chromosome.svh
 * Description:  Genetic Algorithm Chromosome Class
 * Author:       Marcela Simkova <isimkova@fit.vutbr.cz> 
 * Date:         10.5.2013 
 * ************************************************************************** */

/*!
 * \brief Chromosome
 * 
 * This class defines the structure of the chromosome and basic operations 
 * performed with chromosomes.
 */

 class Chromosome extends uvm_sequence_item;
  
   //! UVM Factory Registration Macro
   `uvm_object_utils(Chromosome)
   
  /*! 
   * Data Members
   */  
   
   int          length;             // length of chromosome
   int          chromosome_parts;   // uniform parts of chromosome
   int unsigned fitness;            // fitness function
   real         relativeFitness;    // relative fitness function
   real         roulette_part;      // occupied part of roulette in case of Roulette selection
   rand byte unsigned chromosome[]; // chromosome
   
  /*!
   * Methods
   */

   // Standard UVM methods
   extern function new(string name = "Chromosome");
   
   // Own UVM methods
   extern function void save(string filename);
   extern function void load(string filename);
   extern function void getChromosomes(byte unsigned chromosome[]);
   extern function unsigned int getFitness();
   extern function Chromosome mutate(int unsigned maxMutations);
   extern function Chromosome crossover(Chromosome chrom = null); 
   extern function void setRelativeFitness(int unsigned popFitness);
   extern function real getRelativeFitness();

 endclass: Chromosome
 
 
 
/*! 
 * Constructor - creates the Chromosome object  
 */
 function Chromosome::new(string name = "Chromosome");
   super.new(name);
 endfunction: new  
  

/*
 * It is recommended to use the following methods:
 * copy();
 * clone(); 
 * print();
 * compare();
 */   
    
/*!
 * Saves chromosome to file
 */
 function void Chromosome::save(string filename);
 endfunction: save



/*!
 * Loads chromosome from file
 */
 function void Chromosome::load(string filename);
 endfunction: load


    
/*!
 * Read chromosome
 */
 function void Chromosome::getChromosomes(byte unsigned chromosome[]);
   this.chromosome = chromosome;
 endfunction: getChromosomes 



/*!
 * Returns fitness value of the object instance. 
 */
 function unsigned int Chromosome::getFitness();
   return fitness;
 endfunction: getFitness



/*!
 * Mutates the current value of the object instance.
 */
 function Chromosome Chromosome::mutate(int unsigned maxMutations);
   return this;
 endfunction: mutate



/*!
 * Crossovers the current value of the object instance with the specified 
 * object instance.
 */
 function Chromosome Chromosome::crossover(Chromosome chrom = null);
   return null;
 endfunction: crossover



/*!
 * Computes relative fitness: USED
 */
 function void Chromosome::setRelativeFitness(int unsigned popFitness);
   relativeFitness = real'(fitness)/real'(popFitness);
 endfunction: setRelativeFitness



/*!
 * Get relative fitness.
 */
 function real Chromosome::getRelativeFitness();
   return relativeFitness;
 endfunction: getRelativeFitness