import { defineCollection, z } from 'astro:content';

const hideElements = z.enum([
	'title',
	'date',
	'lastmod',
	'tags',
	'readingTime',
	'toc',
	'comments',
]);
export type PostHideElements = z.infer<typeof hideElements>;

const posts = defineCollection({
	type: 'content',
	schema: ({ image }) =>
		z.object({
			title: z.string(),
			description: z.string().optional(),
			image: image().optional(),
			date: z.date().optional(),
			lastmod: z.date().optional(),
			hidden: z.boolean().optional(),
			tags: z.array(z.string()).optional(),
			readingTime: z
				.object({
					text: z.string(),
					time: z.number(),
					words: z.number(),
					minutes: z.number(),
				})
				.optional(),
			hide: z.array(hideElements).optional(),
		}),
});

const photoCollection = defineCollection({
	type: 'data',
	schema: z.object({
		title: z.string(),
		src: z.string(),
		place: z.string(),
		time: z.string(),
		width: z.number(),
		height: z.number(),
	}),
});

const workCollection = defineCollection({
	type: 'data',
	schema: z.object({
		title: z.string(),
		date: z.string(),
		type: z.enum(['youtube', 'tweet', 'image', 'text']),
		content: z.string(),
		description: z.string().optional(),
		thumbnail: z.string().optional(),
	}),
});

export const collections = {
	posts,
	photos: photoCollection,
	work: workCollection,
};
